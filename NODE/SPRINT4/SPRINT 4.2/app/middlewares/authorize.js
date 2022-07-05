const jwt = require("jsonwebtoken");
const { secret } = require('../config/config.json');

module.exports = authorize;

function authorize (req, res, next) {
    
    //const token = req.header('auth-token');
    const token = req.header('Authorization').slice(7);
    console.log(token);
    if (!token) return res.status(401).json({ error: 'Acceso denegado' })
    try {
        const verified = jwt.verify(token, secret);
        console.log(verified);
        req.user = verified;
        next() // continuamos
    } catch (error) {
        res.status(400).json({error: 'token no es válido'})
    }
}
