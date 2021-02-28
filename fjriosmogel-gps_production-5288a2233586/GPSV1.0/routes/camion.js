/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    TruckController = require('../controllers/camion'),
    truck = express.Router()

truck
    .get('/', TruckController.trucksGet )

truck
    .route('/new')
    .get( TruckController.trucksNewGet )
    .post( TruckController.trucksNewPost )

truck
    .route('/:placa')
    .get( TruckController.trucksIdTruckGet )
    .put( TruckController.trucksIdTruckPut )
    .delete( TruckController.trucksIdTruckDelete )

module.exports = truck