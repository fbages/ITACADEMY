const express = require('express');
const router = express.Router();
const app = express();


//Middlewares



app.use(router);

const PORT = 3000;
app.listen(PORT, ()=>{
    console.log(`Server listen on port 3000`);
})