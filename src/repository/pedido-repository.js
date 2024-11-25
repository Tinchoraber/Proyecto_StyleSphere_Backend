import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;
export default class PedidoRepository {
    crearPedido = async (productos, precioTotal) => { 
        const client = new Client(config);
        try {
            await client.connect();
            await client.query('BEGIN'); // Iniciar transacción

            // Crear un único registro en detallePedido
            const sqlDetalle = `INSERT INTO "detallePedido" ("precioTotal")
                              VALUES ($1) RETURNING "idDetallePedido"`;
            const resultDetalle = await client.query(sqlDetalle, [precioTotal]);
            const idDetallePedido = resultDetalle.rows[0].idDetallePedido;

            // Insertar productos en la tabla intermedia
            for (const producto of productos) {
                const { idCarrito, precio, cantidadAComprar } = producto;

                const sqlRelacion = `INSERT INTO "detallePedido_Carrito" 
                                   ("idDetallePedido", "idCarrito", "precio")
                                   VALUES ($1, $2, $3)`;
                await client.query(sqlRelacion, [
                    idDetallePedido,
                    idCarrito,
                    precio * cantidadAComprar
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
                SELECT dp."idDetallePedido", dp."precioTotal", dpc."idCarrito", dpc."precio", p."imagen", p."nombre", c."cantidadAComprar"
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
                cantidad: row.cantidadAComprar,
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

    actualizarPedido = async (productos, precioTotal, idDetallePedido) => {
        const client = new Client(config);
        try {
            await client.connect();
            await client.query('BEGIN'); // Iniciar transacción

            // Actualizar el precio total del pedido
            const sqlUpdateDetalle = `UPDATE "detallePedido" 
                                      SET "precioTotal" = $1 
                                      WHERE "idDetallePedido" = $2`;
            await client.query(sqlUpdateDetalle, [precioTotal, idDetallePedido]);

            // Actualizar o insertar productos en la tabla intermedia
            for (const producto of productos) {
                const { idCarrito, precio, cantidadAComprar } = producto;

                // Verificar si el producto ya está en el pedido
                const checkQuery = `
                    SELECT * FROM "detallePedido_Carrito" 
                    WHERE "idCarrito" = $1 AND "idDetallePedido" = $2
                `;
                const checkResult = await client.query(checkQuery, [idCarrito, idDetallePedido]);

                if (checkResult.rows.length > 0) {
                    // Si ya existe, actualizamos la cantidad
                    const updateQuery = `
                        UPDATE "detallePedido_Carrito" 
                        SET "precio" = $1, "cantidadAComprar" = $2
                        WHERE "idCarrito" = $3 AND "idDetallePedido" = $4
                    `;
                    await client.query(updateQuery, [precio * cantidadAComprar, cantidadAComprar, idCarrito, idDetallePedido]);
                } else {
                    // Si no existe, insertamos el nuevo producto
                    const sqlRelacion = `INSERT INTO "detallePedido_Carrito" 
                                       ("idDetallePedido", "idCarrito", "precio")
                                       VALUES ($1, $2, $3)`;
                    await client.query(sqlRelacion, [
                        idDetallePedido,
                        idCarrito,
                        precio * cantidadAComprar
                    ]);
                }
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
}



