//imports
let express = require('express');
let router = express.Router();
let controllers = require('../controllers/controller');

//routes
router.get('/user', (req, res) => {
    res.send({ "nom": 'Francesc Bages Sabarich', "edat": 38, "uri": "localhost:3000/user" }); 
});

router.post('/upload', controllers.validateimage);

router.post('/time', controllers.usuariHora);

router.get('/pokemon/:id', controllers.pokemon);

module.exports = router;