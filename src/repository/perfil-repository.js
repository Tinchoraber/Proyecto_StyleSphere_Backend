import config from "../config/db-config.js";
import pkg from 'pg';
import { validarUsername } from './cliente-repository.js';
const { Client } = pkg;

export default class PerfilRepository {
    actualizarPerfil = async (perfil, idCliente) => {
        const client = new Client(config);
        await client.connect();
        
        const sql = `UPDATE "cliente" 
                    SET "nombre" = $1, "apellido" = $2, "correoElectronico" = $3, "contraseña" = $4, "celular" = $5, "fotoPerfil" = $6 
                    WHERE "idCliente" = $7 RETURNING *`;
        let nombre = perfil.nombre;
        let apellido = perfil.apellido;
        let correoElectronico = perfil.correoElectronico;
        let contraseña = perfil.contraseña;
        let celular = perfil.celular;  
        let fotoPerfil = perfil.fotoPerfil;  

        const values = [nombre, apellido, correoElectronico, contraseña, celular, fotoPerfil, idCliente]; 
        const result = await client.query(sql, values);
        console.log(result);
        await client.end();
        const validar = validarUsername(correoElectronico);
        if (!validar) {
            return ['El correo electrónico no es válido', 400];
        }
        if (result.rowCount > 0) {
            return [result.rows, 200];
        } else {
            return ['Error actualizando el perfil', 400];
        }
    }
}
