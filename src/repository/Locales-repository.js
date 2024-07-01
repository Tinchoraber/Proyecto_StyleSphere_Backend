import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class LocalesRepository {
    getAllAsync = async () => { 
        let arrayDevuelto = [];
        const client = new Client(config);
        try {
            await client.connect();
            let sql = 'SELECT * FROM "tienda" GROUP BY "marca", "idTienda" ORDER BY "cantidadVentas" DESC'; // Asegúrate de usar el nombre correcto de la tabla
            const result = await client.query(sql);
            arrayDevuelto = result.rows; // Extraer las filas del resultado
            await client.end();
        } catch (error) {
            console.log(error);
        }
        return arrayDevuelto;
    }
}
