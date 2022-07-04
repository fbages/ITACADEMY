//jasonwatmore.com
const jwt = require('jsonwebtoken');
const {secret} = require('../config/config.json')

exports.retornJWT = async (req,res,next) => {
    const token = jwt.sign({ sub: "hola" }, secret, { expiresIn: '7d' });
    res.send(token);
}

