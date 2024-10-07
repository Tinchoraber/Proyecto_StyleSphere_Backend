import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class BuscadorRepository {
  searchAsync = async (buscado) => {
    let arrayDevuelto = [];
    const client = new Client(config);
    try {
      await client.connect();

      let sqlTienda = `SELECT t.* FROM "tienda" t WHERE lower(t.nombre) LIKE lower($1)`;
      let sqlProducto = `SELECT p.* FROM "producto" p WHERE lower(p.nombre) LIKE lower($1)`;
      let sqlTipoProducto = `SELECT tp.* FROM "tipoproducto" tp WHERE lower(tp.nombre) LIKE lower($1)`;

      let values = [`%${buscado}%`];

      const resultTienda = await client.query(sqlTienda, values);
      const resultProducto = await client.query(sqlProducto, values);
      const resultTipoProducto = await client.query(sqlTipoProducto, values);

      arrayDevuelto = [...resultTienda.rows, ...resultProducto.rows, ...resultTipoProducto.rows];

      console.log(arrayDevuelto);

    } catch (error) {
      console.error('Error al buscar en la base de datos:', error);
    } finally {
      await client.end();
    }

    return arrayDevuelto;
  }
}



