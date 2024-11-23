import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;
export default class PedidoRepository {
    crearPedido = async (productos) => { 
        const client = new Client(config);
        try {
            await client.connect();
            await client.query('BEGIN'); // Iniciar transacción

            // Verificar si alguno de los carritos ya está en un detallePedido
            const carritosIds = productos.map(p => p.idCarrito);
            const sqlVerificar = `
                SELECT "idCarrito" 
                FROM "detallePedido_Carrito" 
                WHERE "idCarrito" = ANY($1)
            `;
            const carritosExistentes = await client.query(sqlVerificar, [carritosIds]);

            if (carritosExistentes.rows.length > 0) {
                const idsExistentes = carritosExistentes.rows.map(row => row.idCarrito);
                throw new Error(`Los siguientes carritos ya están en un pedido: ${idsExistentes.join(', ')}`);
            }

            // Si no hay duplicados, continuamos con la creación
            const precioTotal = productos.reduce((sum, p) => 
                sum + (p.precio * p.cantidadAComprar), 0);

            const sqlDetalle = `INSERT INTO "detallePedido" ("precioTotal")
                              VALUES ($1) RETURNING "idDetallePedido"`;
            const resultDetalle = await client.query(sqlDetalle, [precioTotal]);
            const idDetallePedido = resultDetalle.rows[0].idDetallePedido;

            // Insertar cada relación en la tabla intermedia
            for (const producto of productos) {
                const sqlRelacion = `INSERT INTO "detallePedido_Carrito" 
                                   ("idDetallePedido", "idCarrito", "precio")
                                   VALUES ($1, $2, $3)`;
                await client.query(sqlRelacion, [
                    idDetallePedido,
                    producto.idCarrito,
                    producto.precio * producto.cantidadAComprar
                ]);
            }

            await client.query('COMMIT');
            return [{ idDetallePedido, precioTotal }, 200];
        } catch (error) {
            await client.query('ROLLBACK');
            console.error('Error en repository:', error);
            throw error;
        } finally {
            await client.end();
        }
    }

    obtenerPedidoById = async (idDetallePedido) => {
        const client = new Client(config);
        try {
            await client.connect();

            // Obtener el detalle del pedido
            const queryPedido = `
                SELECT dp."idDetallePedido", dp."precioTotal", dpc."idCarrito", dpc."precio", p."imagen", p."nombre"
                FROM "detallePedido" dp 
                INNER JOIN "detallePedido_Carrito" dpc ON dp."idDetallePedido" = dpc."idDetallePedido" 
                INNER JOIN carrito c ON dpc."idCarrito" = c."idCarrito"
                INNER JOIN producto p ON c."idProducto" = p."idProducto"
                WHERE dp."idDetallePedido" = $1
            `;
            const pedidoResult = await client.query(queryPedido, [idDetallePedido]);

            if (pedidoResult.rows.length === 0) {
                return [{ error: 'Pedido no encontrado' }, 404];
            }

            // Construir la respuesta
            const productos = pedidoResult.rows.map(row => ({
                idCarrito: row.idCarrito,
                precioFinal: row.precio,
                imagen: row.imagen,
                nombre: row.nombre
            }));

            const pedido = {
                idDetallePedido: pedidoResult.rows[0].idDetallePedido,
                precioTotal: pedidoResult.rows[0].precioTotal,
                productos: productos
            };

            return [pedido, 200];
        } catch (error) {
            console.error('Error en repository:', error);
            throw error;
        } finally {
            await client.end();
        }
    }
}



