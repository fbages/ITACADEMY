//require
const conversions = require('./currency_conversions.json');
const Producte = require('./Producte');
const fsp = require('fs/promises');

function conv(conversio,producte){
    conversio = JSON.parse(conversio);
    let divisa = producte.moneda + "_EUR";
    console.log(conversio[divisa]);
    producte.preu_EUR=producte.preu*conversio[divisa];
    console.log(producte);
    return producte;
}

async function decoradorconversio(producte){
    console.log(producte);
    let conversio = await fsp.readFile('./currency_conversions.json','utf8');
    return conv(conversio,producte);

}

module.exports = decoradorconversio;