import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class FavoritoRepository {
    insertFavoritoAsync = async (idProducto, idCliente) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `INSERT INTO favorito ("idProducto", "idCliente") VALUES ($1, $2)`;
        const values = [idProducto, idCliente]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result, 200]
        }
        else{
            return ['Error insertando al carrito ', 400]
        }
        
    }
}


