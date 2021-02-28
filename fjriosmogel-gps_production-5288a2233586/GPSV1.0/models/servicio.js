/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const ServiceModel = require('./coneccion')

function getServiceById(idService, next) {
    ServiceModel
        .query(`SELECT * 
                FROM servicios 
                WHERE idServicio = ?`, idService, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdServiceByName(name, next) {
    ServiceModel
        .query(`SELECT c.idServicio 
                FROM servicios c 
                WHERE c.nombre = ?`, name, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idServicio)
        })
}

function getServices(next) {
    ServiceModel
        .query(`SELECT * 
                FROM servicios` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfServices(next) {
    ServiceModel
        .query(`SELECT c.nombre 
                FROM servicios c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createService(service, next) {
    ServiceModel
        .query(`INSERT INTO servicios
                SET ?`, service, (error, resultado, fields) => {

            next(error)
        })
}

function updateService(service, next) {
    ServiceModel
        .query(`UPDATE servicios 
                SET ? 
                WHERE idServicio = ?`, [service,service.idServicio], (error, resultado, fields) => {

            next(error)
        })
}

function deleteService(idServicio, next) {
    ServiceModel
        .query(`DELETE FROM servicios 
                WHERE idServicio = ?`, idServicio , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getServiceById,
    getIdServiceByName,
    getServices,
    getNamesOfServices,
    createService,
    updateService,
    deleteService
}