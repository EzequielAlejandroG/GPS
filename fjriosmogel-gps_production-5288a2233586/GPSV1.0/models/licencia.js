/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const LicenseModel = require('./coneccion')

function getLicenseById(idLicense, next) {
    LicenseModel
        .query(`SELECT * 
                FROM licencias 
                WHERE idLicencia = ?`, idLicense, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdLicenseByName(name, next) {
    LicenseModel
        .query(`SELECT c.idLicencia 
                FROM licencias c 
                WHERE c.nombre = ?`, name, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idLicencia)
        })
}

function getLicenses(next) {
    LicenseModel
        .query(`SELECT * 
                FROM licencias` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfLicenses(next) {
    LicenseModel
        .query(`SELECT c.nombre 
                FROM licencias c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createLicense(license, next) {
    LicenseModel
        .query(`INSERT INTO licencias
                SET ?`, license, (error, resultado, fields) => {

            next(error)
        })
}

function updateLicense(license, next) {
    LicenseModel
        .query(`UPDATE licencias 
                SET ? 
                WHERE idLicencia = ?`, [license,license.idLicencia], (error, resultado, fields) => {

            next(error)
        })
}

function deleteLicense(idLicencia, next) {
    LicenseModel
        .query(`DELETE FROM licencias 
                WHERE idLicencia = ?`, idLicencia , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getLicenseById,
    getIdLicenseByName,
    getLicenses,
    getNamesOfLicenses,
    createLicense,
    updateLicense,
    deleteLicense
}