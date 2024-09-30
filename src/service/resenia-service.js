import ReseniaRepository from "../repository/resenia-repository.js";
export default class ReseniaRepository{
    getReseniasFromTienda = async (idTienda) => {
        const repo = new ReseniaRepository();
        let arrayRes = await repo.getReseniasFromTienda(idTienda);
        return arrayRes;
    }

    agregarResenia = async (idCliente, idTienda, resenia) => {
        const repo = new ReseniaRepository();
        let arrayRes = await repo.agregarResenia(idCliente, idTienda, resenia);
        return arrayRes;
    }

    actualizarResenia = async (idCliente, reseniaNueva) => {
        const repo = new ReseniaRepository();
        let arrayRes = await repo.actualizarResenia(idCliente, idTienda, reseniaNueva);
        return arrayRes;
    }

    borrarResenia = async (idResenia) => {
        const repo = new ReseniaRepository();
        let arrayRes = await repo.borrarResenia(idResenia);
        return arrayRes;
    }

    
}