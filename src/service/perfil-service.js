import PerfilRepository from "../repository/perfil-repository.js";
export default class PerfilService{
    actualizarPerfil = async (perfil, idCliente) => {
        const repo = new PerfilRepository();
        let arrayRes = await repo.actualizarPerfil(perfil, idCliente);
        return arrayRes;
    }
}