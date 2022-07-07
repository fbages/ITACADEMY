//Variables d'entorn
const dotenv = require("dotenv");
dotenv.config();
const config = require("./config.json");

let database = process.env.DATABASE;

//Seleccio database
if (database == "mysql") {
  const mysql = require("mysql2/promise");
  const { Sequelize } = require("sequelize");

  dbMysql = {}; //fa la variable global accessible a tot el programa (seria com declara un var)

  initialize();

  async function initialize() {

    const { host, port, databaseName } = config.dbmysql;
    const user = process.env.DATABASE_USER;
    const password = process.env.DATABASE_PASSWORD;

    const connection = await mysql.createConnection({
      host,
      port,
      user,
      password,
    });
    //await connection.query(`DROP DATABASE IF EXISTS \`${database}\`;`);
    await connection.query(`CREATE DATABASE IF NOT EXISTS \`${databaseName}\`;`);
    console.log("Conectat a la base de dades de Mysql");
    // connect to db
    const sequelize = new Sequelize(databaseName, user, password, {
      dialect: "mysql",
    });

    // init models and add them to the exported db object
    dbMysql.Jugadors = require("../models/jugadorModel")(sequelize);
    dbMysql.Partides = require("../models/partidaModel")(sequelize);
    // sync all models with database
    await sequelize.sync();
  }
  require("../helpers/mysqlCrudService");

} else if (database == "mongodb") {
  const mongoose = require("mongoose");
  const jugadorSchema = require("../models/jugadorModelMongoDB");
  const partidaSchema = require("../models/partidaModelMongoDB");
  
  dbMongoDB = {};//fa la variable global accessible a tot el programa (seria com declara un var)
  
  //Middleware abans de salvar els fitxers, pero despres de executar el create al service
   jugadorSchema.pre('validate', async (next)=>{
    console.log("hola pre");
    const jsultimJugador = await dbMongoDB.Jugadors.find({}).limit(1).sort({id:-1})|| [];
      console.log(jsultimJugador)
    dbMongoDB.maxIndex = (jsultimJugador.length!=0)?(Number(jsultimJugador[0].id) + 1):0;
    console.log(dbMongoDB.maxIndex);
    return next();
  });

  jugadorSchema.post('save', (doc,next)=>{
    console.log("hola post");
    return next();
  })


  initialize();

  async function initialize() {
    const { host, port, databaseName } = config.dbmongo;
    const user = process.env.DATABASEMONGO_USER;
    const password = process.env.DATABASEMONGO_PASSWORD;
    await mongoose.connect("mongodb://" + host + ":"+ port + "/" + databaseName);
    console.log("Conectat a la base de dades de MongoDB");


    dbMongoDB.Jugadors = mongoose.model("Jugadors", jugadorSchema);
    dbMongoDB.Partides = mongoose.model("Partides", partidaSchema);
  }
  require("../helpers/mongodbCrudService");
}
