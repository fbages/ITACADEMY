const http = require('http');
const https = require('https');

exports.validateimage = (req, res) => {
    if (!req.files) {
        res.send({
            status: false,
            message: 'No has pujat cap fitxer'
        });
    } else if (req.files) {
        let tipoFitxer = req.files.imatge;
        let tipo = tipoFitxer.name.slice(-3).toUpperCase();
        console.log(tipo);
        if (tipo === "PNG" || tipo === "JPG" || tipo === "GIF") {
            res.send('Imatge rebuda correctament')
        } else {
            res.send('Fitxer pujat no és una imatge amb format "PNG", "JPG" o "GIF"');
        }
    }
};

exports.usuariHora = (req, res) => {

    if (!req.body) {
        res.send({
            status: false,
            message: 'No hi ha cap fitxer JSON'
        });
    } else if (req.body) {
        if (req.body) {
            console.log(req.body.nom);
            res.send({ 'hora': new Date() });
        }
    }
}

exports.pokemon = async (req, res) => {
    let idPokemon = req.params.id;
    let output = '';


    //configuracio de la peticio HTTPS
    const options = {
        host: 'pokeapi.co',
        port: 443,
        path: '/api/v2/pokemon/' + idPokemon,
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    };
    const port = options.port == 443 ? https : http;

    const req2 = port.request(options, (res2) => {
        
        console.log(`statusCode: ${res2.statusCode}`);
        res2.setEncoding('utf8');

        res2.on('data', chunk => {
            output += chunk;
          });

        res2.on('end', () => {
            let obj = JSON.parse(output);
            res.send(`El nom del pokemon és ${obj.name}, la seva alçada és ${obj.height} i pesa ${obj.weight}`);
            //  onResult(res.statusCode, obj);
        });
    })

    req2.on('error', (err) => {
         res2.send('error: ' + err.message);
    });

    req2.end( );
    
}