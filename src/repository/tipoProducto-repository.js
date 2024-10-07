import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class LocalesRepository {
    getAllAsync = async () => { 
        let arrayDevuelto = [];
        const client = new Client(config);
        try {
            await client.connect();
            let sql = 'SELECT * FROM "tipoproducto" ORDER BY "cantidadVentas" DESC'; 
            const result = await client.query(sql);
            arrayDevuelto = result.rows; 
            await client.end();
        } catch (error) {
            console.log(error);
        }
        return arrayDevuelto;
    }
}
