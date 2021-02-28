/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const LocationModel = require('./coneccion')

function getLocationById(idLocation, next) {
    LocationModel
        .query(`SELECT * 
                FROM ubicaciones 
                WHERE placa = ?`, idLocation, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdLocationByName(placa, next) {
    LocationModel
        .query(`SELECT c.placa 
                FROM ubicaciones c 
                WHERE c.placa = ?`, placa, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].placa)
        })
}

function getLocations(next) {
    LocationModel
        .query(`SELECT * 
                FROM ubicaciones WHERE placa!=" "` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfLocations(next) {
    LocationModel
        .query(`SELECT c.placa 
                FROM ubicaciones c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createLocation(location, next) {
    LocationModel
        .query(`INSERT INTO ubicaciones
                SET ?`, location, (error, resultado, fields) => {

            next(error)
        })
}

function updateLocation(location, next) {
    LocationModel
        .query(`UPDATE ubicaciones 
                SET ? 
                WHERE placa = ?`, [location,location.placa], (error, resultado, fields) => {

            next(error)
        })
}

function deleteLocation(placa, next) {
    LocationModel
        .query(`DELETE FROM ubicaciones 
                WHERE placa = ?`, placa, (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getLocationById,
    getIdLocationByName,
    getLocations,
    getNamesOfLocations,
    createLocation,
    updateLocation,
    deleteLocation
}