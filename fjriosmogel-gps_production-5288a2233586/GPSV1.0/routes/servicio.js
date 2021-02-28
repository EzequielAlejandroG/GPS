/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    ServiceController = require('../controllers/servicio'),
    service = express.Router()

service
    .get('/', ServiceController.servicesGet )

service
    .route('/new')
    .get( ServiceController.servicesNewGet )
    .post( ServiceController.servicesNewPost )

service
    .route('/:idServicio')
    .get( ServiceController.servicesIdServiceGet )
    .put( ServiceController.servicesIdServicePut )
    .delete( ServiceController.servicesIdServiceDelete )

module.exports = service