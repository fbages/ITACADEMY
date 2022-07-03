const config = require('../config/config.json');
const mysql = require('mysql2/promise');
const { Sequelize } = require('sequelize');

module.exports = db = {};

initialize();

async function initialize() {
    // create db if it doesn't already exist
    const { host, port, user, password, database } = config.database;
    console.log(database);
    const connection = await mysql.createConnection({ host, port, user, password });
    //await connection.query(`DROP DATABASE IF EXISTS \`${database}\`;`);
    await connection.query(`CREATE DATABASE IF NOT EXISTS \`${database}\`;`);

    // connect to db
    const sequelize = new Sequelize(database, user, password, { dialect: 'mysql' });

    // init models and add them to the exported db object
    db.Jugadors = require('../models/jugadorModel')(sequelize);
    db.Partides = require('../models/partidaModel')(sequelize);

    // sync all models with database
    await sequelize.sync();
}