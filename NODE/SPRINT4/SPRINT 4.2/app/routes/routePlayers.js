const express = require('express');
let router = express.Router();
const controllersJugador = require('../controllers/playerController');

router.post('/players/:nom', controllersJugador.crearJugador);

router.put('/players/:id', controllersJugador.actualitzarJugador);

router.get('/players', controllersJugador.llistatJugadors);

module.exports = router;