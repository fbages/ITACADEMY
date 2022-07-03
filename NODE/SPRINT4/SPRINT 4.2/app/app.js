const express = require('express');
const errorHandler = require('./middlewares/errorHandler');
const routerPlayers = require('./routes/routePlayers');
const routerPartides = require('./routes/routePartides');
const routerRanking = require('./routes/routeRanking');
const app = express();

//Conexio a BD
//const db = connectioBD.connectarBD();



//Routes
app.use(routerPlayers);
app.use(routerPartides);
app.use(routerRanking);

//Middleware ErrorHandler a posteriori de les routes
app.use(errorHandler);

const PORT = 3000;
app.listen(PORT, ()=>{
    console.log(`Server listen on port 3000`);
})