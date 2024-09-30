import express from "express";
import cors from "cors";
import session from 'express-session'; // Importando sesión
import passport from 'passport';
import pkg from 'pg';
const { Pool } = pkg;

import { Strategy as GoogleStrategy } from 'passport-google-oauth20';
import tipoProductoRouter from "./src/controller/tipoProducto-controller.js";
import BuscadorRouter from './src/controller/buscador-controller.js';
import LocalesRouter from "./src/controller/locales-controller.js";
import ProductoRouter from './src/controller/producto-controller.js';
import ClienteRouter from './src/controller/cliente-controller.js';
import CarritoRouter from './src/controller/carrito-controller.js';
import FavoritoRouter from './src/controller/favorito-controller.js';
import PerfilRouter from './src/controller/perfil-controller.js';
import ReseniaRouter from './src/controller/resenia-controller.js';
import dbconfig from './src/config/db-config.js';

const app = express();
const port = 3001;

app.use(cors());
app.use(express.json());

app.use(session({
    secret: 'dddddd',
    resave: false,
    saveUninitialized: true,
}));

app.use(passport.initialize());
app.use(passport.session());

const pool = new Pool(dbconfig);

// Configurar la estrategia de Google para Passport con logs adicionales
passport.use(new GoogleStrategy({
    clientID: "328951780159-6tdfduuc7o4vk4fl5kdmjp0l5n31nba9.apps.googleusercontent.com",
    clientSecret: "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",
    callbackURL: "http://localhost:3001/auth/google/callback"
},
async (accessToken, refreshToken, profile, done) => {
    try {
        console.log("Access Token:", accessToken); // Log para verificar el accessToken
        console.log("Refresh Token:", refreshToken); // Log para verificar el refreshToken
        console.log("Profile:", profile); // Log para ver toda la información del perfil

        const { id, displayName, emails, photos } = profile;
        let photoUrl = photos && photos.length ? photos[0].value : "https://definicion.de/wp-content/uploads/2019/07/perfil-de-usuario.png";
        const [nombre, ...apellido] = displayName.split(" ");
        const mail = emails[0].value;
        const telefono = profile.phoneNumbers ? profile.phoneNumbers[0].value : null;

        // Verificar si el usuario ya existe en la base de datos
        const res = await pool.query('SELECT * FROM cliente WHERE "idclientgoogle" = $1', [id]);
        let user = res.rows[0];

        // Si el usuario no existe, lo creamos en la base de datos
        if (!user) {
            console.log("Usuario no encontrado, creando nuevo usuario..."); // Log si el usuario no existe
            const tempPassword = "password_temporal"; // Contraseña temporal o un valor por defecto
            const result = await pool.query(
                'INSERT INTO cliente ("idclientgoogle", "nombre", "apellido", "correoElectronico", "celular", "fotoPerfil", "contraseña") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *',
                [id, nombre, apellido.join(" "), mail, telefono, photoUrl, tempPassword] // Ahora incluimos el password
            );
            user = result.rows[0];
            console.log("Nuevo usuario creado:", user); // Log para mostrar el nuevo usuario creado
        } else {
            console.log("Usuario existente:", user); // Log si el usuario ya existe
        }

        return done(null, user);
    } catch (err) {
        console.error("Error en la autenticación con Google:", err); // Log para capturar cualquier error
        return done(err, null);
    }
}));

// Serializar el usuario en la sesión
passport.serializeUser((user, done) => {
    done(null, user.idclientgoogle); // Usamos el idclientgoogle para identificar al usuario
});

// Deserializar el usuario desde la sesión
passport.deserializeUser(async (id, done) => {
    try {
        const res = await pool.query('SELECT * FROM cliente WHERE "idclientgoogle" = $1', [id]);
        if (res.rows.length === 0) {
            return done(new Error('Usuario no encontrado'), null);
        }
        const user = res.rows[0];
        done(null, user);
    } catch (err) {
        done(err, null);
    }
});

// Ruta para autenticar con Google
app.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

// Callback después de la autenticación
app.get('/auth/google/callback', 
    passport.authenticate('google', { failureRedirect: '/' }),
    (req, res) => {
        const user = req.user; // Usuario autenticado
        // Redirige al front-end con la información del usuario
        res.redirect(`http://localhost:3000/views/Inicio?user=${encodeURIComponent(JSON.stringify(user))}`);
    }
);

// Rutas API
app.use("/api/tipoProducto", tipoProductoRouter);
app.use("/api/locales", LocalesRouter);
app.use("/api/buscador", BuscadorRouter);
app.use("/api/producto", ProductoRouter);
app.use("/api/cliente", ClienteRouter);
app.use("/api/carrito", CarritoRouter);
app.use("/api/favorito", FavoritoRouter);
app.use("/api/perfil", PerfilRouter);
app.use("/api/resenia", ReseniaRouter);



app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});
