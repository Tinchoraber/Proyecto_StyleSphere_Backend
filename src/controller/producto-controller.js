import { Router } from 'express';
import ProductoService from '../service/producto-service.js';

const router = Router();
const svc = new ProductoService();

router.get('/productos_filtro', async (req, res) => {
    const { seleccionados } = req.query;
    if (!seleccionados) {
        return res.status(400).json({ error: 'No se han proporcionado productos para filtrar' });
    }
    const productosFiltrados = seleccionados.split(',');
    try {
        const resultados = await svc.getProductosFiltrados(productosFiltrados);
        if (resultados.length === 0) {
            res.status(404).json({ message: 'No hay productos' });
        } else {
            res.status(200).json(resultados);
        }
    } catch (error) {
        console.error('Error al obtener los productos:', error);
        res.status(500).json({ error: 'Error al obtener los productos' });
    }
});

router.get('/:id', async (req, res) => {
    const id = parseInt(req.params.id, 10);

    if (isNaN(id)) {
        return res.status(400).json({ error: 'id debe ser un número entero' });
    }

    try {
        const arrayDevuelto = await svc.getAllByIdAsync(id);
        if (arrayDevuelto.length === 0) {
            res.status(404).send('No hay productos');
        } else {
            res.status(200).json(arrayDevuelto);
        }
    } catch (error) {
        console.error('Error al obtener los productos:', error);
        res.status(500).send('Error al obtener los productos');
    }
});

router.get('/tienda/:idTienda', async (req, res) => {
    console.log('entro aca')
    const idTienda = parseInt(req.params.idTienda, 10);

    try {
        const arrayDevuelto = await svc.getProductosByMarca(idTienda);
        if (arrayDevuelto.length === 0) {
            res.status(404).send('No hay productos');
        } else {
            res.status(200).json(arrayDevuelto);
        }
    } catch (error) {
        console.error('Error al obtener los productos:', error);
        res.status(500).send('Error al obtener los productos');
    }
});

/*router.get('/productos_guardados', async (req, res) => {
    const { favoritosSeleccionados } = req.query;
    console.log(favoritosSeleccionados)
    if (!favoritosSeleccionados) {
        return res.status(400).json({ error: 'No hay productos guardados' });
    }
    const productosFavoritos = guardados.split(',').map(Number);
    console.log(productosFavoritos)
    try {
        const favoritos = await svc.getProductosFavoritos(productosFavoritos);
        console.log(favoritos)
        res.json(favoritos);
    } catch (error) {
        res.status(500).json({ error: 'Error al obtener productos guardados' });
    }
    
});*/

router.get('/filtro_categorias/:idTipoProducto', async (req, res) => {
    const {talle, color, precioMin, precioMax } = req.query;
    const idTipoProducto = parseInt(req.params.idTipoProducto, 10);
    const arrayDevuelto = await svc.getAllFilteredAsync(idTipoProducto, talle, color, precioMin, precioMax);
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No se encontraron productos');
    } else {
        res.status(200).json(arrayDevuelto);
    }
});
export default router;
