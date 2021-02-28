/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    RutaController = require('../controllers/ruta'),
    ruta = express.Router()

ruta
    .get('/', RutaController.rutasGet )

ruta
    .route('/new')
    .get( RutaController.rutasNewGet )
    .post( RutaController.rutasNewPost )

ruta
    .route('/:idRuta')
    .get( RutaController.rutasIdRutaGet )
    .put( RutaController.rutasIdRutaPut )

ruta
    .route('/:idRuta2') 
    .get( RutaController.rutas2IdRutaGet ) 
    .put( RutaController.rutas2IdRutaPut )    

module.exports = ruta