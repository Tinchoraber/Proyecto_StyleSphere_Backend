import config from "../config/db-config.js";
import pkg from 'pg';
//import jwt from 'jsonwebtoken';
const { Client } = pkg;

export default class ClienteRepository{
    loginAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
        let correoElectronico = body.email;
        let password = body.password;
        console.log(body.password)
        const sql = `SELECT * FROM "cliente" WHERE "correoElectronico" = $1 and "contraseña" = $2`;
        const values = [correoElectronico, password];
        const result = await client.query(sql, values);
        console.log(result)
        await client.end();
        
        
        if(result.rowCount == 0){
            return ["Usuario o clave inválida.", 401];
        }

        const validar = this.validarUsername(correoElectronico); 
        if(!validar){
            return ["El email es inválido.", 400];
        } else {
            return [result.rows[0], 200];
        }
    }

    validarUsername(correoElectronico) {
        const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        return regex.test(correoElectronico);
    }
}