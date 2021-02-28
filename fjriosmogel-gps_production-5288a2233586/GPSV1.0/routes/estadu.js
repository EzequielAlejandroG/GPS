/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    StatuController = require('../controllers/estadu'),
    statu = express.Router()

statu
    .get('/', StatuController.statusGet )

statu
    .route('/new')
    .get( StatuController.statusNewGet )
    .post( StatuController.statusNewPost )

statu
    .route('/:idEstado')
    .get( StatuController.statusIdStatuGet )
    .put( StatuController.statusIdStatuPut )
    .delete( StatuController.statusIdStatuDelete )

module.exports = statu