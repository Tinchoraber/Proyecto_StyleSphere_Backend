import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class FavoritoRepository {
    getFavorito = async (idCliente) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM favorito WHERE "idCliente" = $1`;
        const values = [idCliente]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result.rows, 200]
        }
        else{
            return ['Error seleccionando los favoritos', 400]
        }
        
    }
    insertFavoritoAsync = async (idProducto, idCliente) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `INSERT INTO favorito ("idProducto", "idCliente") VALUES ($1, $2) RETURNING *`;
        const values = [idProducto, idCliente]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result.rows, 200]
        }
        else{
            return ['Error insertando al carrito ', 400]
        }
        
    }

    deleteFavorito = async (idFavorito) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `DELETE FROM favorito WHERE "idFavorito" = $1 RETURNING *`;
        const values = [idFavorito]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result.rows, 200]
        }
        else{
            return ['Error insertando al carrito ', 400]
        }
        
    }

    
}


