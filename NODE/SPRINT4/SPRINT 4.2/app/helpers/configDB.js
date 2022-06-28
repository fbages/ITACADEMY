const Sequelize = require('sequelize');

const dataBase = new Sequelize('dados_model', 'root', 'ITAcademy', {
    host: 'localhost',
    dialect: 'mysql',   /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
});


async function connectarBD(){
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
        return sequelize;
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
} 
// connectarBD();

let Jugador = dataBase.define('jugadors',
{
    id: {
        type: Sequelize.INTEGER, 
        primaryKey: true,
        autoIncrement: true,
    },
    nom: Sequelize.STRING,
    percentatge:Sequelize.DOUBLE,
    data_registre: Sequelize.DATE
},{
    freezeTableName: true,
    timestamps: false
}
);
Jugador.sync();
Jugador.create({id:1,nom:"nomJugador22"});

module.exports = {
   // Jugador
};