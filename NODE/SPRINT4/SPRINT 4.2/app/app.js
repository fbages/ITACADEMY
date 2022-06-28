const express = require('express');
const connectioBD = require('./config/configDB');
const routerPlayers = require('./routes/routePlayers');
const routerPartides = require('./routes/routePartides');
const routerRanking = require('./routes/routeRanking');
const app = express();

//Conexio a BD
//const db = connectioBD.connectarBD();

//Middlewares


//Routes
app.use(routerPlayers);
app.use(routerPartides);
app.use(routerRanking);


const PORT = 3000;
app.listen(PORT, ()=>{
    console.log(`Server listen on port 3000`);
})