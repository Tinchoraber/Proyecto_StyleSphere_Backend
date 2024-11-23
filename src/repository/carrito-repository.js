import config from "../config/db-config.js";
import pkg from "pg";
const { Client } = pkg;

export default class CarritoRepository {
  selectCarritoAsync = async (idCliente) => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT c.*, p.* FROM "carrito" c INNER JOIN producto p ON c."idProducto" = p."idProducto" WHERE c."idCliente" = $1`;
    const values = [idCliente];
    const result = await client.query(sql, values);
    await client.end();
    if (result.rowCount > 0) {
      return [result.rows, 200];
    } else {
      return ["Error insertando al carrito ", 400];
    }
  };

  insertCarritoAsync = async (idProducto, idCliente, cantidad, color, talle) => {
    const client = new Client(config);
    await client.connect();
    const sql = `INSERT INTO carrito ("idProducto", "idCliente", "cantidadAComprar", "color", "talle")
                                VALUES ($1, $2, $3, $4, $5)`;
    const values = [idProducto, idCliente, cantidad, color, talle];
    const result = await client.query(sql, values);
    await client.end();
    if (result.rowCount > 0) {
      return [result.rows, 200];
    } else {
      return ["Error insertando al carrito ", 400];
    }
  };

  updateCarritoAsync = async (idProducto, idCliente, cantidad) => {
    const client = new Client(config); 
    await client.connect();

    const sql = `UPDATE "carrito" SET "cantidadAComprar" = $1 WHERE "idProducto" = $2 AND "idCliente" = $3`;
    const values = [cantidad, idProducto, idCliente];
    const result = await client.query(sql, values);
    await client.end();
    if (result.rowCount > 0) {
      return [result.rows, 200]; 
    } else {
      return ["Error actualizando el carrito", 400]; 
    }
  };

  borrarProductoCarritoAsync = async (idCarrito) => {
    const client = new Client(config);
    try {
        await client.connect();
        
        // Primero verificamos si el producto está en algún pedido
        const checkQuery = `
            SELECT EXISTS (
                SELECT 1 
                FROM "detallePedido_Carrito" 
                WHERE "idCarrito" = $1
            )`;
        const checkResult = await client.query(checkQuery, [idCarrito]);
        
        if (checkResult.rows[0].exists) {
            throw new Error('No se puede eliminar el producto porque ya forma parte de un pedido');
        }

        // Si no está en ningún pedido, procedemos con el borrado
        const deleteQuery = 'DELETE FROM carrito WHERE "idCarrito" = $1 RETURNING *';
        const result = await client.query(deleteQuery, [idCarrito]);
        
        return [result.rows[0], result.rowCount > 0 ? 200 : 404];
    } catch (error) {
        console.error('Error en repository:', error);
        throw error;
    } finally {
        await client.end();
    }
  };
}
