/**
 *Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    TrailerController = require('../controllers/remolque'),
    trailer = express.Router()

trailer
    .get('/', TrailerController.trailersGet )

trailer
    .route('/new')
    .get( TrailerController.trailersNewGet )
    .post( TrailerController.trailersNewPost )

trailer
    .route('/:idRemolque')
    .get( TrailerController.trailersIdTrailerGet )
    .put( TrailerController.trailersIdTrailerPut )
    .delete( TrailerController.trailersIdTrailerDelete )

module.exports = trailer