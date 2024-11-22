import PedidoRepository from "../repository/pedido-repository.js";
export default class PedidoService{
    crearPedido = async (productos, precioTotal) => {
        const repo = new PedidoRepository();
        let arrayRes = await repo.crearPedido(productos, precioTotal);
        return arrayRes;
    }

    
}