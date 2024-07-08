import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class ProductoRepository{
    getAllByIdAsync = async (id) => { 
        let arrayDevuelto = [];
        const client = new Client(config);
        try {
            await client.connect();
            const values = [id]
            let sql = 'SELECT * FROM "producto" p INNER JOIN "tipoproducto" tp ON p."idTipoProducto" = tp."idTipoProducto" WHERE tp."idTipoProducto" = $1'
            const result = await client.query(sql, values);
            arrayDevuelto = result.rows; // Extraer las filas del resultado
            await client.end();
        } catch (error) {
            console.log(error);
        }
        return arrayDevuelto;
    }
}