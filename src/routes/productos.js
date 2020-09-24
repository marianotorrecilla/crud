const express = require('express');
const router = express.Router();
const path = require('path');

const productosController = require(path.resolve(__dirname,'..','controllers','productosController'));

router.get('/productos', productosController.index);
router.get('/productos/detalle/:id', productosController.detalle);


module.exports = router;