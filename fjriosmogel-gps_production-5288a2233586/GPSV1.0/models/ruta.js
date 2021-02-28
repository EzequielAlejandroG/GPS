/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const RutaModel = require('./coneccion')

function getRutaById(idRuta, next) {
    RutaModel
        .query(`select r.idRuta, r.idVehiculo, r.noEconomico, r.idRemolque, r.salida, r.destino, r.idConductor, r.fechaSalida, r.fechaLlegada, r.tiempoEstimado,r.idEstado, r.idPrioridad,r.created_at, u.latitud, u.longitud, u.estadoGeoreferencia, u.municipioGeoreferencia, u.asentamientoGeoreferencia, u.direccionGeoreferencia, u.placa
                FROM rutas r, ubicaciones u where r.idRuta = ?`, idRuta, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}



function getIdRutaByPlaza(plaza, next) {
    RutaModel
        .query(`SELECT s.idRuta 
                FROM rutas s 
                WHERE s.plaza = ?`,  plaza, (error, resultado, fields) => {
            try{ // si suerge un error es de la base de datos
                next(error, resultado[0].idRuta)
            }catch(error){ // si no se encontro ruta
                next(error = null, 0)
            }        
        })
}

function getPlazasOfRutas(next) {
    RutaModel
        .query(`SELECT s.plaza 
                FROM rutas s`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getIdRutaOfRutas(next) {
    RutaModel
        .query(`SELECT s.idRuta 
                FROM rutas s`, (error, resultado, fields) => {

            next(error, resultado)
        })
}
//mostrar datos en la tabla//
function getRutas(next) {
    RutaModel
        .query(`select r.idRuta, r.idVehiculo, r.noEconomico, r.idRemolque, r.salida, r.destino, r.idConductor, r.fechaSalida, r.fechaLlegada, r.tiempoEstimado,r.idEstado, r.idPrioridad,r.created_at, u.latitud, u.longitud, u.estadoGeoreferencia, u.municipioGeoreferencia, u.asentamientoGeoreferencia, u.direccionGeoreferencia, u.placa
                FROM rutas r, ubicaciones u where u.noEconomico=r.noEconomico`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createRuta(ruta, next) {
    RutaModel
        .query(`INSERT INTO rutas 
                SET ?`, ruta, (error, resultado, fields) => {

            next(error)
        })
}

function updateRuta(ruta, next) {
    RutaModel
        .query(`UPDATE rutas s 
                SET ? 
                WHERE s.idRuta = ?`, [ruta,ruta.idRuta], (error, resultado, fields) => {

            next(error)
        })
}


function deleteRuta(idRuta, next) {
    RutaModel
        .query(`DELETE FROM rutas 
                WHERE idRuta = ? `, idRuta , (error, resultado, fields) => {

            next(error)
        })
}



function getRuta2ById(idRuta2, next) {
    RutaModel
        .query(`SELECT * 
                FROM rutas s 
                WHERE s.idRuta = ?`, idRuta2, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}



function getIdRuta2ByPlaza(plaza, next) {
    RutaModel
        .query(`SELECT s.idRuta 
                FROM rutas s 
                WHERE s.plaza = ?`,  plaza, (error, resultado, fields) => {
            try{ // si suerge un error es de la base de datos
                next(error, resultado[0].idRuta2)
            }catch(error){ // si no se encontro ruta
                next(error = null, 0)
            }        
        })
}

function getPlazasOfRutas2(next) {
    RutaModel
        .query(`SELECT s.plaza 
                FROM rutas s`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getIdRuta2OfRutas(next) {
    RutaModel
        .query(`SELECT s.idRuta 
                FROM rutas s`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getRutas2(next) {
    RutaModel
        .query(`SELECT * 
                FROM rutas`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createRuta2(ruta2, next) {
    RutaModel
        .query(`INSERT INTO rutas 
                SET ?`, ruta, (error, resultado, fields) => {

            next(error)
        })
}

function updateRuta2(ruta2, next) {
    RutaModel
        .query(`UPDATE rutas s 
                SET ? 
                WHERE s.idRuta = ?`, [ruta,ruta.idRuta2], (error, resultado, fields) => {

            next(error)
        })
}


function deleteRuta2(idRuta2, next) {
    RutaModel
        .query(`DELETE FROM rutas 
                WHERE idRuta = ? `, idRuta2 , (error, resultado, fields) => {

            next(error)
        })
}


module.exports = {
    getRutaById,
    getPlazasOfRutas,
    getIdRutaOfRutas,
    getIdRutaByPlaza,
    getRutas,
    createRuta,
    updateRuta,
    deleteRuta,
    getRuta2ById,
    getPlazasOfRutas2,
    getIdRuta2OfRutas,
    getIdRuta2ByPlaza,
    getRutas2,
    createRuta2,
    updateRuta2,
    deleteRuta2,
}