import { Router } from 'express';
import PerfilService from '../service/perfil-service.js';
const router = Router();
const svc = new PerfilService();

router.put('/:idCliente', async (req, res) => {
    const idCliente = req.params.idCliente
    const perfil = req.body;
    const returnArray = await svc.actualizarPerfil(perfil, idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});

export default router;