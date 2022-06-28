const express = require('express');
let router = express.Router();
const rankingController = require('../controllers/rankingController');

router.get('/ranking', rankingController.llistatGuanyadors);

router.get('/ranking/loser', rankingController.perdedor);

router.get('/ranking/winner', rankingController.guanyador);

module.exports = router;