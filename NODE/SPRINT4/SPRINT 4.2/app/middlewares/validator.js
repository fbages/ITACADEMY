const {param,body,query} = require('express-validator');
const { validationResult } = require('express-validator');

exports.valIdNumber = [
    param('nom').default('Anonim').isLength({min:3,max:10}).withMessage("El nom ha de tenir com a mínim 3 caràcters i màxim 10"), 
]

exports.valIdNumberQueryMin = [
    param('id').isNumeric().withMessage("'id' ha de ser un número"),
    query('nom').isLength({min:3,max:10}).withMessage("El body ha de tenir un key,'nom', amb un string com a valor de minim 3 caràcters i màxim 10")
]