const express = require('express');
let router = express.Router();
const controllersJugador = require('../controllers/playerController');

router.post('/players/:nom', controllersJugador.crearJugador);


module.exports = router;