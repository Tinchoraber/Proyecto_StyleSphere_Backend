import config from "../config/db-config.js";
import pkg from 'pg';
import jwt from 'jsonwebtoken';
const { Client } = pkg;

export default class ClienteRepository{
    validarUsername(correoElectronico) {
        const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        return regex.test(correoElectronico);
    }
    
    loginAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
    
        let correoElectronico = body.email;
        let password = body.password;
    
        const sql = `SELECT * FROM "cliente" WHERE "correoElectronico" = $1 AND "contraseña" = $2`;
        const values = [correoElectronico, password];
        const result = await client.query(sql, values);
        await client.end();
    
        const validar = this.validarUsername(correoElectronico);
    
        if (!validar || result.rowCount === 0) {
            return ["El email o la contraseña es inválido.", 400];
        } else {
            const user = result.rows[0];
            console.log('Usuario encontrado:', user); // Agrega un log aquí para verificar
    
            const payload = {
                idCliente: user.idCliente,  
                username: user.correoElectronico,
                role: 'user',
            };
    
            const secretKey = process.env.ACCESS_TOKEN_SECRET || 'ClaveSuperSecreta2006$';
            const token = jwt.sign(payload, secretKey);
    
            console.log('Token generado:', token); 
    
            return [{ token, idCliente: user.idCliente }, 200];
        }
    };
    
    
    

    registerAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
        console.log('aca en el repo', body);
    
        let nombre = body.nombre;
        let apellido = body.apellido;
        let correoElectronico = body.email;
        let password = body.password;
        let celular = body.celular;
    
        const sql = `
            INSERT INTO "cliente"("nombre", "apellido", "correoElectronico", "contraseña", "celular")
            VALUES($1, $2, $3, $4, $5)
            RETURNING *`;  
    
        const values = [nombre, apellido, correoElectronico, password, celular];
        const result = await client.query(sql, values);
        await client.end();
    
        const validar = this.validarUsername(correoElectronico);
        if (!validar || result.rowCount === 0) {
            return ['El email o la contraseña es inválido.', 400];
        } else {
            return [result.rows[0], 201];
        }
    };
    
}
