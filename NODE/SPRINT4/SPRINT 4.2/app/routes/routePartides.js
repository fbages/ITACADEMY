const express = require('express');
let router = express.Router();
const partidesController = require('../controllers/partidesController');

router.post('/games/:id', partidesController.jugarPartida);

router.delete('/games/:id', partidesController.eliminarPartides);

router.get('/games/:id', partidesController.llistatPartides);

module.exports = router;