/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const TruckModel = require('./coneccion')

function getTruckById(idTruck, next) {
    TruckModel
        .query(`SELECT * 
                FROM ubicaciones 
                WHERE placa = ?`, idTruck, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdTruckByName(placa, next) {
    TruckModel
        .query(`SELECT c.placa 
                FROM ubicaciones c 
                WHERE c.placa = ?`, placa, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].placa)
        })
}

function getTrucks(next) {
    TruckModel
        .query(`SELECT * 
                FROM ubicaciones WHERE placa!=" "` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfTrucks(next) {
    TruckModel
        .query(`SELECT c.placa 
                FROM ubicaciones c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createTruck(truck, next) {
    TruckModel
        .query(`INSERT INTO ubicaciones
                SET ?`, truck, (error, resultado, fields) => {

            next(error)
        })
}

function updateTruck(truck, next) {
    TruckModel
        .query(`UPDATE ubicaciones 
                SET ? 
                WHERE placa = ?`, [truck,truck.placa], (error, resultado, fields) => {

            next(error)
        })
}

function deleteTruck(placa, next) {
    TruckModel
        .query(`DELETE FROM ubicaciones 
                WHERE placa = ?`, placa, (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getTruckById,
    getIdTruckByName,
    getTrucks,
    getNamesOfTrucks,
    createTruck,
    updateTruck,
    deleteTruck
}