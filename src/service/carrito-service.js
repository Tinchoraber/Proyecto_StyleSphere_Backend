import CarritoRepository from "../repository/carrito-repository.js";
export default class CarritoService{
    insertCarritoAsync = async (idProducto, idCliente) => {
        const repo = new CarritoRepository();
        let arrayRes = await repo.insertCarritoAsync(idProducto, idCliente);
        return arrayRes;
    }
}