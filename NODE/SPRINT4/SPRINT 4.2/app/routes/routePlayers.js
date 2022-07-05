const express = require('express');
let router = express.Router();
const {param, query} = require('express-validator');
const validMiddleware = require('../middlewares/validator');
const controllersJugador = require('../controllers/playerController');
const authorize = require('../middlewares/authorize');

router.post('/players/:nom', authorize, validMiddleware.valIdNumber, controllersJugador.crearJugador);
router.post('/players/', validMiddleware.valIdNumber, controllersJugador.crearJugador);

router.put('/players/:id', validMiddleware.valIdNumberQueryMin, controllersJugador.actualitzarNomJugador);

router.get('/players', controllersJugador.llistatJugadors);

module.exports = router;