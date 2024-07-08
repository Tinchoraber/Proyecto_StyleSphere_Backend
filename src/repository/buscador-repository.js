import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class BuscadorRepository {
  searchAsync = async (buscado) => {
    let arrayDevuelto = [];
    const client = new Client(config); // Importa tu configuración de conexión desde db-config.js

    try {
      await client.connect();

      // Consulta SQL para buscar cualquier coincidencia con la letra
      let sql = `
        SELECT DISTINCT t.*, p.*, tp.*
        FROM "tienda" t
        INNER JOIN "producto" p ON t."idTienda" = p."idTienda"
        INNER JOIN "TipoProducto" tp ON p."idTipoProducto" = tp."idTipoProducto"
        WHERE lower(t.nombre) LIKE $1
           OR lower(p.nombre) LIKE $1
           OR lower(tp.nombre) LIKE $1`;

      const result = await client.query(sql, [`%${buscado.toLowerCase()}%`]);
      arrayDevuelto = result.rows; // Extraer las filas del resultado

    } catch (error) {
      console.error('Error al buscar en la base de datos:', error);
    } finally {
      await client.end(); // Asegurarse de cerrar la conexión
    }

    return arrayDevuelto;
  }
}
