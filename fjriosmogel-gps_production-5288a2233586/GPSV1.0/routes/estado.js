/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    StateController = require('../controllers/estado'),
    state = express.Router()

state
    .get('/', StateController.statesGet )

state
    .route('/new')
    .get( StateController.statesNewGet )
    .post( StateController.statesNewPost )

state
    .route('/:idEstado')
    .get( StateController.statesIdStateGet )
    .put( StateController.statesIdStatePut )
    .delete( StateController.statesIdStateDelete )

module.exports = state