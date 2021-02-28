/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    PriorityController = require('../controllers/prioridad'),
    priority = express.Router()

priority
    .get('/', PriorityController.prioritiesGet )

priority
    .route('/new')
    .get( PriorityController.prioritiesNewGet )
    .post( PriorityController.prioritiesNewPost )

priority
    .route('/:idPrioridad')
    .get( PriorityController.prioritiesIdPriorityGet )
    .put( PriorityController.prioritiesIdPriorityPut )
    .delete( PriorityController.prioritiesIdPriorityDelete )

module.exports = priority