const mongoose = require('mongoose');
const jugadorSchema = require('../models/jugadorModelMongoDB');
const partidaSchema = require('../models/partidaModelMongoDB');

module.exports = db = {};

initialize();

async function initialize(){
    await mongoose.connect('mongodb://localhost:27017/test');
    console.log('Conectat a la base de dades de MongoDB');

    db.Jugadors = mongoose.model('Jugadors', jugadorSchema);
    db.Partides = mongoose.model('Partides', partidaSchema);
}
