//imports
let express = require('express');
let router = express.Router();


//routes
router.get('/user', (req, res) => {
    res.send({ "nom": 'Francesc Bages Sabarich', "edat": 38, "uri": "localhost:3000/user" });
})

router.post('/upload', (req, res) => {
    let imatge = req;
    console.log(imatge);
    
    res.send('Imatge rebuda correctament')
})

module.exports = router;