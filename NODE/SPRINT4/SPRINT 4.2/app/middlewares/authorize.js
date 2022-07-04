const jwt = require("express-jwt");
const { secret } = require('../config/config.json');

moudle.exports = authorize;

function authorize() {
    return expressJwt({ secret, algorithms: ['HS256'] }).unless({
        path: [
            // public routes that don't require authentication
            '/login'
        ]
    });
}
