const Sequelize = require('sequelize')

async function connectarBD(){

    const sequelize = new Sequelize('dados_model', 'root', 'ITAcademy', {
        host: 'localhost',
        dialect: 'mysql'   /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
    });
    
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
    
}

module.exports = {
    connectarBD
};