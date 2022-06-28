const { DataTypes } = require('sequelize');

module.exports = model;

function model(sequelize) {
    const attributes = {
        nom: { type: DataTypes.STRING, allowNull: false },
        percentatge: { type: DataTypes.INTEGER, allowNull: true },
        data_registre: { type: DataTypes.DATE, allowNull: false },
    };

    const options = {
        timestamps: false
    };

    return sequelize.define('jugadors', attributes, options);
}