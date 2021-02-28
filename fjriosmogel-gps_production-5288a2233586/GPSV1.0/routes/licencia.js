/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    LicenseController = require('../controllers/licencia'),
    license = express.Router()

license
    .get('/', LicenseController.licensesGet )

license
    .route('/new')
    .get( LicenseController.licensesNewGet )
    .post( LicenseController.licensesNewPost )

license
    .route('/:idLicencia')
    .get( LicenseController.licensesIdLicenseGet )
    .put( LicenseController.licensesIdLicensePut )
    .delete( LicenseController.licensesIdLicenseDelete )

module.exports = license