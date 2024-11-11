import TarjetaRepository from "../repository/tarjeta-repository.js";
export default class TarjetaService{
    getAllTarjetasFromClienteAsync = async (idCliente) => {
        const repo = new TarjetaRepository();
        let arrayRes = await repo.getAllTarjetasFromClienteAsync(idCliente);
        return arrayRes;
    }

    agregarTarjeta = async (idCliente, tarjeta) => {
        const repo = new TarjetaRepository();
        let arrayRes = await repo.agregarTarjeta(idCliente, tarjeta);
        return arrayRes;
    }

    borrarTarjeta = async (idTarjeta) => {
        const repo = new TarjetaRepository();
        let arrayRes = await repo.borrarTarjeta(idTarjeta);
        return arrayRes;
    }
    
}