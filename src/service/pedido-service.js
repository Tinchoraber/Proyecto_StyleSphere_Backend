import PedidoRepository from "../repository/pedido-repository.js";
export default class PedidoService{
    crearPedido = async (productos, precioTotal, idDetallePedido = null) => {
        const repo = new PedidoRepository();
        return await repo.crearPedido(productos, precioTotal, idDetallePedido);
    }

    obtenerPedidoById = async (idDetallePedido) => {
        const repo = new PedidoRepository();
        return await repo.obtenerPedidoById(idDetallePedido);
    }

    actualizarPedido = async (productos, precioTotal, idDetallePedido) => {
        const repo = new PedidoRepository();
        return await repo.actualizarPedido(productos, precioTotal, idDetallePedido);
    }
}