import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class ClienteRepository{
    loginAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
        let email = body.email;
        let password = body.password;
        const sql = `SELECT * FROM "cliente" WHERE "email" = $1 and "contraseña" = $2`;
        const values = [email, password];
        const result = await client.query(sql, values);
        await client.end();
        
        if(result.rowCount == 0){
            return [{
                success: false,
                message: "Usuario o clave inválida.",
                token: ""
            }, 401];
        }

        const user = result.rows[0];
        const payload = {
            id: user.id,
            email: user.email
        };
        const secretKey = process.env.ACCESS_TOKEN_SECRET || 'ClaveSuperSecreta2006$';
        const token = jwt.sign(payload, secretKey);

        const validar = this.validarUsername(email); 
        if(!validar){
            return [{
                success: false,
                message: "El email es inválido.",
                token: ""
            }, 400];
        } else {
            return [{
                success: true,
                message: "Inicio de sesión exitoso.",
                token: token
            }, 200];
        }
    }

    validarUsername(email) {
        const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        return regex.test(email);
    }
}