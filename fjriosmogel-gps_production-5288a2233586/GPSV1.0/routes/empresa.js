/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    CompanyController = require('../controllers/empresa'),
    company = express.Router()

company
    .get('/', CompanyController.businessGet )

company
    .route('/new')
    .get( CompanyController.businessNewGet )
    .post( CompanyController.businessNewPost )

company
    .route('/:idEmpresa')
    .get( CompanyController.businessIdCompanyGet )
    .put( CompanyController.businessIdCompanyPut )
    .delete( CompanyController.businessIdCompanyDelete )

module.exports = company