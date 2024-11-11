import PedidoRepository from "../repository/pedido-repository.js";
export default class PedidoRepository{
    crearPedido = async (idCliente, tarjeta) => {
        const repo = new TarjetaRepository();
        let arrayRes = await repo.crearPedido(idCliente, tarjeta);
        return arrayRes;
    }

    
}