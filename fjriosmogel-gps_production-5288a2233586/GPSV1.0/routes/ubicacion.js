/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    LocationController = require('../controllers/ubicacion'),
    location = express.Router()

location
    .get('/', LocationController.locationsGet )

location
    .route('/new')
    .get( LocationController.locationsNewGet )
    .post( LocationController.locationsNewPost )


location
    .route('/:placa')
    .get( LocationController.locationsIdLocationGet )
    .put( LocationController.locationsIdLocationPut )
    .delete( LocationController.locationsIdLocationDelete )

module.exports = location