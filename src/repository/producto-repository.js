import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class ProductoRepository {
    getAllByIdAsync = async (id) => { 
        const client = new Client(config);
        let arrayDevuelto = [];

        try {
            await client.connect();
            const values = [id];
            const sql = 'SELECT * FROM "producto" p WHERE p."idTipoProducto" = $1';
            const result = await client.query(sql, values);
            arrayDevuelto = result.rows;
            console.log(arrayDevuelto)
        } catch (error) {
            console.error('Error al obtener los productos:', error);
            throw error;
        } finally {
            await client.end();
        }

        return arrayDevuelto;
    }

    getProductosFiltrados = async () => {
        const client = new Client(config);
        let arrayDevuelto = [];

        try {
            await client.connect();
            const sql = 'SELECT * FROM "producto" WHERE "idTipoProducto" = ANY($1::int[])';
            const values = [productosFiltrados];
            const result = await client.query(sql, values);
            arrayDevuelto = result.rows;
            console.log(arrayDevuelto)
        } catch (error) {
            console.error('Error al obtener los productos:', error);
            throw error;
        } finally {
            await client.end();
        }

        return arrayDevuelto;
    }
    
}
