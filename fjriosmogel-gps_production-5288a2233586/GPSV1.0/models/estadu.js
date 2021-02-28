/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const StatuModel = require('./coneccion')

function getStatuById(idStatu, next) {
    StatuModel
        .query(`SELECT * 
                FROM status 
                WHERE idEstado = ?`, idStatu, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdStatuByName(name, next) {
    StatuModel
        .query(`SELECT c.idEstado 
                FROM status c 
                WHERE c.nombre = ?`, name, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idEstado)
        })
}

function getStatus(next) {
    StatuModel
        .query(`SELECT * 
                FROM status` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfStatus(next) {
    StatuModel
        .query(`SELECT c.nombre 
                FROM status c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createStatu(statu, next) {
    StatuModel
        .query(`INSERT INTO status
                SET ?`, statu, (error, resultado, fields) => {

            next(error)
        })
}

function updateStatu(statu, next) {
    StatuModel
        .query(`UPDATE status 
                SET ? 
                WHERE idEstado = ?`, [statu,statu.idEstado], (error, resultado, fields) => {

            next(error)
        })
}

function deleteStatu(idEstado, next) {
    StatuModel
        .query(`DELETE FROM status 
                WHERE idEstado = ?`, idEstado , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getStatuById,
    getIdStatuByName,
    getStatus,
    getNamesOfStatus,
    createStatu,
    updateStatu,
    deleteStatu
}