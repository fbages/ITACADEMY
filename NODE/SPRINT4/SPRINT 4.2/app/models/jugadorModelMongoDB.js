const {Schema } = require('mongoose');

const jugadorSchema = new Schema({
    nom : String,
    percentatge : Number,
    registre : {type: Date, default : Date.now}
});


module.exports = jugadorSchema;