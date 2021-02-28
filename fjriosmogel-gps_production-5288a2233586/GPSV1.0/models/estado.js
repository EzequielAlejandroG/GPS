/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const StateModel = require('./coneccion')

function getStateById(idState, next) {
    StateModel
        .query(`SELECT * 
                FROM estados 
                WHERE idEstado = ?`, idState, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdStateByName(name, next) {
    StateModel
        .query(`SELECT c.idEstado 
                FROM estados c 
                WHERE c.nombre = ?`, name, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idEstado)
        })
}

function getStates(next) {
    StateModel
        .query(`SELECT * 
                FROM estados` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfStates(next) {
    StateModel
        .query(`SELECT c.nombre 
                FROM estados c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createState(state, next) {
    StateModel
        .query(`INSERT INTO estados
                SET ?`, state, (error, resultado, fields) => {

            next(error)
        })
}

function updateState(state, next) {
    StateModel
        .query(`UPDATE estados 
                SET ? 
                WHERE idEstado = ?`, [state,state.idEstado], (error, resultado, fields) => {

            next(error)
        })
}

function deleteState(idEstado, next) {
    StateModel
        .query(`DELETE FROM estados 
                WHERE idEstado = ?`, idEstado , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getStateById,
    getIdStateByName,
    getStates,
    getNamesOfStates,
    createState,
    updateState,
    deleteState
}