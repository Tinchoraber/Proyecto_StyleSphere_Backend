import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class ReseniaRepository {
    getReseniasFromTienda = async (idTienda) => {
        const client = new Client(config);
        await client.connect();
        const values = [idTienda]
        const sql = `SELECT * FROM "reseña" WHERE "idTienda" = $1`;
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result.rows, 200]
        }
        else{
            return ['Error trayendo las reseñas ', 400]
        }
        
    }

    agregarResenia = async (idCliente, idTienda, resenia) => { 
        const client = new Client(config);
        await client.connect();
        const comentario = resenia.comentario;
        const valoracion = resenia.valoracion;
        const sql = `INSERT INTO reseña ("idTienda", "comentario", "valoracion", "idCliente")
                                VALUES ($1, $2, $3, $4)`;
        const values = [idTienda,comentario, valoracion, idCliente]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result, 200]
        }
        else{
            return ['Error insertando la reseña ', 400]
        }
        
    }

    actualizarResenia = async (idCliente, idTienda, reseniaNueva) => { 
        const client = new Client(config);
        await client.connect();
        const comentario = reseniaNueva.comentario;
        const valoracion = reseniaNueva.valoracion;
        const sql = `UPDATE "reseña" 
        SET "idTienda" = $1, "comentario" = $2, "valoracion" = $3 WHERE "idCliente" = $4 RETURNING *`;
        const values = [idTienda, comentario, valoracion, idCliente]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result, 200]
        }
        else{
            return ['Error actualizando la reseña ', 400]
        }
        
    }

    borrarResenia = async (idResenia) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `DELETE * FROM "reseña" WHERE idReseña = $1 RETURNING *`;
        const values = [idResenia]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result, 200]
        }
        else{
            return ['Error actualizando la reseña ', 400]
        }
        
    }
}
