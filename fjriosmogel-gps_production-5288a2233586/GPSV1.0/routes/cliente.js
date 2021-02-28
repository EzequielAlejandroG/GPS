/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    CustomerController = require('../controllers/cliente'),
    customer = express.Router()

customer
    .get('/', CustomerController.customersGet )

customer
    .route('/new')
    .get( CustomerController.customersNewGet )
    .post( CustomerController.customersNewPost )

customer
    .route('/:idCliente')
    .get( CustomerController.customersIdCustomerGet )
    .put( CustomerController.customersIdCustomerPut )
    .delete( CustomerController.customersIdCustomerDelete )

module.exports = customer