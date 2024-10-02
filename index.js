import express from "express";
import cors from "cors";
import session from 'express-session'; // Importando sesión
import passport from 'passport';
import pkg from 'pg';
import jwt from 'jsonwebtoken';

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

passport.use(new GoogleStrategy({
    clientID: "328951780159-6tdfduuc7o4vk4fl5kdmjp0l5n31nba9.apps.googleusercontent.com",
    clientSecret: "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",
    callbackURL: "http://localhost:3001/auth/google/callback"
},
async (accessToken, refreshToken, profile, done) => {
    try {
        console.log("Access Token:", accessToken); 
        console.log("Refresh Token:", refreshToken); 
        console.log("Profile:", profile);

        const { id, displayName, emails, photos } = profile;
        let photoUrl = photos && photos.length ? photos[0].value : "https://definicion.de/wp-content/uploads/2019/07/perfil-de-usuario.png";
        const [nombre, ...apellido] = displayName.split(" ");
        const mail = emails[0].value;
        const telefono = profile.phoneNumbers ? profile.phoneNumbers[0].value : null;

        const res = await pool.query('SELECT * FROM cliente WHERE "idclientgoogle" = $1', [id]);
        let user = res.rows[0];

        if (!user) {
            console.log("Usuario no encontrado, creando nuevo usuario..."); 
            const tempPassword = "password_temporal";
            const result = await pool.query(
                'INSERT INTO cliente ("nombre", "apellido", "correoElectronico", "celular", "fotoPerfil", "contraseña","idclientgoogle") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *',
                [id, nombre, apellido.join(" "), mail, telefono, photoUrl, tempPassword] 
            );
            user = result.rows[0];
            console.log("Nuevo usuario creado:", user); 
        } else {
            console.log("Usuario existente:", user); 
        }

        return done(null, user);
    } catch (err) {
        console.error("Error en la autenticación con Google:", err); 
        return done(err, null);
    }
}));

passport.serializeUser((user, done) => {
    done(null, user.idclientgoogle); 
});

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

app.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'] }));

app.get('/auth/google/callback', 
    passport.authenticate('google', { failureRedirect: '/' }),
    (req, res) => {
        const user = req.user;
        const token = jwt.sign({ idCliente: user.idclientgoogle }, 'ClaveSuperSecreta2006$');  // Generar token para Google

        res.redirect(`http://localhost:3000/views/Inicio?user=${encodeURIComponent(JSON.stringify(user))}&token=${token}`); // Incluir el token
    }
);

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
