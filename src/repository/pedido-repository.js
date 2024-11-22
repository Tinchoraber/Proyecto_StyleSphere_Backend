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

            // Insertar todas las relaciones en la tabla intermedia
            for (const producto of productos) {
                const sqlRelacion = `INSERT INTO "detallePedido_Carrito" 
                                   ("idDetallePedido", "idCarrito", "precio")
                                   VALUES ($1, $2, $3)`;
                await client.query(sqlRelacion, [
                    idDetallePedido,
                    producto.idCarrito,
                    producto.precio * producto.cantidadAComprar // Multiplicamos por la cantidad
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
}



