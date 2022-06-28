const { DataTypes } = require('sequelize/types');
const sequelize = require('../config/config');

const Jugador = sequelize.define('jugadors',
{
    nom: {
        type: DataTypes.STRING,
        allowNull: false
    }
}
)


module.exports = { 
    Jugador 
}