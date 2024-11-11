import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class TarjetaRepository {
    getAllTarjetasFromClienteAsync = async (idCliente) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM "tarjeta" WHERE "idCliente" = $1`;
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

    agregarTarjeta = async (idCliente, tarjeta) => { 
        const client = new Client(config);
        await client.connect();
        const nombreTitular = tarjeta.titular;
        const numeroTarjeta = tarjeta.numero;
        const fechaVencimiento = tarjeta.fechavencimiento;
        const fechadesde = tarjeta.fechadesde;
        const sql = `INSERT INTO tarjeta ("nombreDelTitular", "numeroDeTarjeta", "idCliente", "fechavencimiento", "fechadesde")
                                VALUES ($1, $2, $3, $4, $5)`;
        const values = [nombreTitular, numeroTarjeta, idCliente, fechaVencimiento, fechadesde]
        const result = await client.query(sql, values);
        await client.end();
        if(result.rowCount > 0){
            return [result.rows, 200]
        }
        else{
            return ['Error insertando la tajeta ', 400]
        }
        
    }

    borrarTarjeta = async (idTarjeta) => { 
        const client = new Client(config);
        await client.connect();
        const sql = `DELETE FROM "tarjeta" WHERE "idTarjeta" = $1 RETURNING *`;
        const values = [idTarjeta]
        const result = await client.query(sql, values);
        console.log(result)
        await client.end();
        if(result.rowCount > 0){
            return [result.rows, 200]
        }
        else{
            return ['Error actualizando la tarjeta ', 400]
        }
        
    }
}



