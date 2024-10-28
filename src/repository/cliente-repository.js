import config from "../config/db-config.js";
import pkg from "pg";
import jwt from "jsonwebtoken";
const { Client } = pkg;

export default class ClienteRepository {
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

      const payload = {
        idCliente: user.idCliente,
        username: user.correoElectronico,
        role: "user",
      };

      const secretKey =
        process.env.ACCESS_TOKEN_SECRET || "ClaveSuperSecreta2006$";
      const token = jwt.sign(payload, secretKey);

      return [
        {
          token,
          idCliente: user.idCliente,
          nombre: user.nombre,
          apellido: user.apellido,
        },
        200,
      ];
    }
  };

  registerAsync = async (body) => {
    const client = new Client(config);
    await client.connect();
    console.log("aca en el repo", body);

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
      return ["El email o la contraseña es inválido.", 400];
    } else {
      return [result.rows[0], 201];
    }
  };

  updateContraseña = async (email, nuevaContraseña) => {
    const validar = this.validarExisteCorreo(email);
    const client = new Client(config);
    await client.connect();
    const sql =
      'UPDATE "cliente" SET "contraseña" = $1 WHERE "correoElectronico" = $2 RETURNING *';
    const values = [nuevaContraseña, email];
    const result = await client.query(sql, values);
    await client.end();

    if (!validar || result.rowCount === 0) {
      return ["El email no existe.", 400];
    } else {
      return [result.rows, 201];
    }
  };

  validarExisteCorreo = async (email) => {
    const validado = false;
    const client = new Client(config);
    await client.connect();
    const sql = 'SELECT * FROM "cliente" WHERE "correoElectronico" = $1';
    const values = [email];
    const result = await client.query(sql, values);
    await client.end();

    if (result.rowCount > 0) {
      return validado = true;
    } else {
      return validado = false;
    }
  };
}
