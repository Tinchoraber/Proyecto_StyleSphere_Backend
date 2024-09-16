import config from "../config/db-config.js";
import pkg from 'pg';
const { Client } = pkg;

export default class ProductoRepository {
    getAllByIdAsync = async (id) => { 
        const client = new Client(config);
        let arrayDevuelto = [];

        try {
            await client.connect();
            const values = [id];
            const sql = 'SELECT * FROM "producto" p WHERE p."idTipoProducto" = $1';
            const result = await client.query(sql, values);
            arrayDevuelto = result.rows;
        } catch (error) {
            console.error('Error al obtener los productos:', error);
            throw error;
        } finally {
            await client.end();
        }

        return arrayDevuelto;
    }

    getProductosFiltrados = async (productosFiltrados) => {
        const client = new Client(config);
        let arrayDevuelto = [];
    
        try {
            await client.connect();
            const sql = 'SELECT * FROM "producto" WHERE "idTipoProducto" = ANY($1::int[])';
            const values = [productosFiltrados];
            const result = await client.query(sql, values);
            arrayDevuelto = result.rows;
        } catch (error) {
            console.error('Error al obtener los productos:', error);
            throw error;
        } finally {
            await client.end();
        }
    
        return arrayDevuelto;
    }
    
    getProductosByMarca = async(idTienda) =>{
        const client = new Client(config);
        await client.connect();

        const query = `SELECT p.*, t."marca", t."imagenTienda",t."direccion",t."horarioApertura", t."horarioClausura" FROM "producto" p INNER JOIN "tienda" t ON p."idTienda" = t."idTienda" WHERE p."idTienda" = $1 `;
        const values = [idTienda];

        const result = await client.query(query, values);
        if(result.rows == 0){
            const query2 = 'SELECT marca from tienda WHERE "idTienda" = $1';
            const values = [idTienda];
            const result2 = await client.query(query2, values);
            await client.end();
            return result2.rows;
        }
        else{
            await client.end();
            console.log("entroa a result",result.rows)
            return result.rows;
        }
        
    }

    /*getProductosFavoritos = async (productosFavoritos) => {
        const client = new Client(config);
        await client.connect();

        const query = `SELECT * FROM "producto" WHERE "idProducto" = ANY($1::int[])`;
        const values = [productosFavoritos];

        const result = await client.query(query, values);
        await client.end();

        return result.rows;
    }*/

    getAllFilteredAsync = async (idTipoProducto, talle, color, precioMin, precioMax) => { 
        let arrayDevuelto = [];
        const client = new Client(config);
        try {
            await client.connect();

            // Crear la base de la query
            let sql = `SELECT * FROM "producto" WHERE "idTipoProducto" = $1`;
            const values = [idTipoProducto];

            // Agregar filtros condicionales
            if (talle) {
                sql += ` AND "talle" = $${values.length + 1}`;
                values.push(talle);
            }

            if (color) {
                sql += ` AND "color" = $${values.length + 1}`;
                values.push(color);
            }

            if (precioMin !== undefined && precioMax !== undefined) {
                sql += ` AND "precio" BETWEEN $${values.length + 1} AND $${values.length + 2}`;
                values.push(precioMin, precioMax);
            }

            sql += ' ORDER BY "cantidadVentas" DESC'; 

            const result = await client.query(sql, values);
            arrayDevuelto = result.rows;
            await client.end();
        } catch (error) {
            console.log(error);
        }
        return arrayDevuelto;
    }

    getProductosFiltrados = async (productosFiltrados, idTienda) => {
        const client = new Client(config);
        let arrayDevuelto = [];
    
        try {
            await client.connect();
            const sql = 'SELECT * FROM "producto" WHERE "idTipoProducto" = ANY($1::int[]) AND "idTienda" = $2';
            const values = [productosFiltrados, idTienda];
            const result = await client.query(sql, values);
            arrayDevuelto = result.rows;
        } catch (error) {
            console.error('Error al obtener los productos:', error);
            throw error;
        } finally {
            await client.end();
        }
    
        return arrayDevuelto;
    }
}
    

