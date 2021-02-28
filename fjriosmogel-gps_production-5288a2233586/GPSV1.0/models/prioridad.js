/**
 *Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const PriorityModel = require('./coneccion')

function getPriorityById(idPriority, next) {
    PriorityModel
        .query(`SELECT * 
                FROM prioridades 
                WHERE idPrioridad = ?`, idPriority, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdPriorityByName(name, next) {
    PriorityModel
        .query(`SELECT c.idPrioridad 
                FROM prioridades c 
                WHERE c.nombre = ?`, name, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idPrioridad)
        })
}

function getPriorities(next) {
    PriorityModel
        .query(`SELECT * 
                FROM prioridades` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfPriorities(next) {
    PriorityModel
        .query(`SELECT c.nombre 
                FROM prioridades c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createPriority(priority, next) {
    PriorityModel
        .query(`INSERT INTO prioridades
                SET ?`, priority, (error, resultado, fields) => {

            next(error)
        })
}

function updatePriority(priority, next) {
    PriorityModel
        .query(`UPDATE prioridades 
                SET ? 
                WHERE idPrioridad = ?`, [priority,priority.idPrioridad], (error, resultado, fields) => {

            next(error)
        })
}

function deletePriority(idPrioridad, next) {
    PriorityModel
        .query(`DELETE FROM prioridades 
                WHERE idPrioridad = ?`, idPrioridad , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getPriorityById,
    getIdPriorityByName,
    getPriorities,
    getNamesOfPriorities,
    createPriority,
    updatePriority,
    deletePriority
}