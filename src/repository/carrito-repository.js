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
    await client.connect();
    const sql = `DELETE FROM "carrito" WHERE "idCarrito" = $1 RETURNING *`;
    const values = [idCarrito];
    const result = await client.query(sql, values);
    await client.end();
    if (result.rowCount > 0) {
      return [result.rows, 200]; 
    } else {
      return ["Error actualizando el carrito", 400]; 
    }
  };
}
