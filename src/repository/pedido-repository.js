import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class TarjetaRepository {
    crearPedido = async (idCliente, tarjeta) => { 
        const client = new Client(config);
        await client.connect();
        const nombreTitular = tarjeta.titular;
        const numeroTarjeta = tarjeta.numero;
        const fechaVencimiento = tarjeta.fechavencimiento;
        const fechadesde = tarjeta.fechadesde;
        const sql = `INSERT INTO pedido ("idProducto", "cantidad", "idPedido")
                                VALUES ($1, $2, $3)`;
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

}



