import CarritoRepository from "../repository/carrito-repository.js";
export default class CarritoService {
  selectCarritoAsync = async (idCliente) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.selectCarritoAsync(idCliente);
    return arrayRes;
  };

  insertCarritoAsync = async (idProducto, idCliente, cantidad) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.insertCarritoAsync(
      idProducto,
      idCliente,
      cantidad
    );
    return arrayRes;
  };

  // service.js
  updateCarritoAsync = async (idProducto, idCliente, cantidad) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.updateCarritoAsync(idProducto,idCliente,cantidad); 
    return arrayRes; // Retorna el resultado al controlador
  };
}
