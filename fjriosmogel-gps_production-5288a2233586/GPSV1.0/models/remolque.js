/**
 *Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const TrailerModel = require('./coneccion')

function getTrailerById(idTrailer, next) {
    TrailerModel
        .query(`SELECT * 
                FROM remolques 
                WHERE idRemolque = ?`, idTrailer, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdTrailerByName(raz, next) {
    TrailerModel
        .query(`SELECT c.idRemolque 
                FROM remolques c 
                WHERE c.nombre = ?`, nom, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idRemolque)
        })
}

function getTrailers(next) {
    TrailerModel
        .query(`SELECT * 
                FROM remolques` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfTrailers(next) {
    TrailerModel
        .query(`SELECT c.nombre 
                FROM remolques c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createTrailer(trailer, next) {
    TrailerModel
        .query(`INSERT INTO remolques
                SET ?`, trailer, (error, resultado, fields) => {

            next(error)
        })
}

function updateTrailer(trailer, next) {
    TrailerModel
        .query(`UPDATE remolques 
                SET ? 
                WHERE idRemolque = ?`, [trailer,trailer.idRemolque], (error, resultado, fields) => {

            next(error)
        })
}

function deleteTrailer(idRemolque, next) {
    TrailerModel
        .query(`DELETE FROM remolques 
                WHERE idRemolque = ?`, idRemolque , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getTrailerById,
    getIdTrailerByName,
    getTrailers,
    getNamesOfTrailers,
    createTrailer,
    updateTrailer,
    deleteTrailer
}