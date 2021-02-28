/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    ConductorController = require('../controllers/conductor'),
    conductor = express.Router()

conductor
    .get('/', ConductorController.conductoresGet )

conductor
    .route('/new')
    .get( ConductorController.conductoresNewGet )
    .post( ConductorController.conductoresNewPost )

conductor
    .route('/:idConductor')
    .get( ConductorController.conductoresIdConductorGet )
    .put( ConductorController.conductoresIdConductorPut )
    .delete( ConductorController.conductoresIdConductorDelete )

module.exports = conductor