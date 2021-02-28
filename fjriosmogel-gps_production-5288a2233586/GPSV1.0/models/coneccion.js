/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const mysql = require('mysql'),
    //dbOptions = require('./config'),
    //myConnection = mysql.createConnection(dbOptions)
    myConnection = mysql.createConnection("mysql://root:abcd1234@localhost:/inventario");
myConnection.connect( err => {
    return (err) ? console.log('Error al conectarse a mysql: '+err.stack) : console.log('Conexión establecida con mysql')
})

module.exports = myConnection