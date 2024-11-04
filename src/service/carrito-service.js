import CarritoRepository from "../repository/carrito-repository.js";
export default class CarritoService {
  selectCarritoAsync = async (idCliente) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.selectCarritoAsync(idCliente);
    return arrayRes;
  };

  insertCarritoAsync = async (idProducto, idCliente, cantidad, color, talle) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.insertCarritoAsync(idProducto, idCliente, cantidad, color, talle);
    return arrayRes;
  };

  updateCarritoAsync = async (idProducto, idCliente, cantidad) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.updateCarritoAsync(idProducto, idCliente, cantidad); 
    return arrayRes; 
  };

  borrarProductoCarritoAsync = async (idCarrito) => {
    const repo = new CarritoRepository();
    let arrayRes = await repo.borrarProductoCarritoAsync(idCarrito); 
    return arrayRes; 
  };
}
