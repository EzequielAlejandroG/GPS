/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const ConductorModel = require('./coneccion')

function getConductorById(idConductor, next) {
    ConductorModel
        .query(`SELECT t.idConductor,t.nombres, t.apellidos,t.curp,t.direccion,t.categoria,t.base,t.numeroLicencia,t.idLicencia,t.expedicion,t.vigencia, t.nacionalidad,t.numeroSeguro, t.fechaIngreso,t.idUsuario,t.created_at, s.nombre
                FROM conductores t
                JOIN licencias s ON t.idConductor = s.idLicencia
                WHERE t.idConductor = ?`, idConductor, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdConductorByName(nombre, next) {
    ConductorModel
        .query(`SELECT t.idConductor 
                FROM conductores t 
                WHERE t.nombres = ?`, nombre, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idConductor)
        })
}




function getConductoresNameByLicense(idLicense, next) {
    ConductorModel
        .query(`SELECT concat(t.nombres,' ',t.apellidos) nombres
                FROM conductores t
                WHERE t.idLicencia = ?`, idLicense, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getConductores(next) {
    ConductorModel
        .query(`SELECT t.nombres, t.apellidos, t.idConductor,t.curp,t.direccion,t.categoria,t.base,t.numeroLicencia,t.idLicencia,t.expedicion,t.vigencia, t.nacionalidad,t.numeroSeguro, t.fechaIngreso,t.idUsuario,s.nombre
                FROM conductores t
                INNER JOIN licencias s ON t.idLicencia = s.idLicencia`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getAllIdConductor(next) {
    ConductorModel
        .query(`SELECT t.idConductor
                FROM conductores t`, (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getconductoresByLicense(idLicense, next) {
    ConductorModel
        .query(`SELECT t.nombres, t.apellidos, t.idConductor,t.curp,t.direccion,t.categoria,t.base,t.numeroLicencia,t.idLicencia,t.expedicion,t.vigencia, t.nacionalidad,t.numeroSeguro, t.fechaIngreso,t.idUsuario
                FROM conductores t
                WHERE t.idLicencia = ?`, idLicense , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createConductor(conductor, next) {
    ConductorModel
        .query(`INSERT INTO conductores
                SET ?`, conductor, (error, resultado, fields) => {

            next(error)
        })
}

function updateConductor(conductor, next) {
    ConductorModel
        .query(`UPDATE conductores
                SET ?
                WHERE idConductor = ?`, [conductor, conductor.idConductor], (error, resultado, fields) => {

            next(error)
        })
}

function deleteConductor(idConductor, next) {
    ConductorModel
        .query(`DELETE FROM conductores 
                WHERE idConductor = ? `, idConductor , (error, resultado, fields) => {

            next(error)
        })
}


function getNamesOfConductor(next) {
    ConductorModel
        .query(`SELECT t.nombres 
                FROM conductores t` , (error, resultado, fields) => {

            next(error, resultado)
        })
}



////////////////////////////////////////////base/////////////////////////
function getConductor2ById(idConductor2, next) {
    ConductorModel
        .query(`SELECT t.idConductor,t.nombres, t.apellidos,t.curp,t.direccion,t.categoria,t.base,t.numeroLicencia,t.idLicencia,t.expedicion,t.vigencia, t.nacionalidad,t.numeroSeguro, t.fechaIngreso,t.idUsuario,t.created_at, s.razonSocial
                FROM conductores t
                JOIN empresas s ON t.idConductor = s.idEmrpesa
                WHERE t.idConductor = ?`, idConductor2, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}
function getConductoresNameByEmpresa(idEmrpesa, next) {
    ConductorModel
        .query(`SELECT concat(t.nombres,' ',t.apellidos) nombres
                FROM conductores t
                WHERE t.idEmrpesa = ?`, idEmrpesa, (error, resultado, fields) => {

            next(error, resultado)
        })
}
function getConductores2(next) {
    ConductorModel
        .query(`SELECT t.nombres, t.apellidos, t.idConductor,t.curp,t.direccion,t.categoria,t.base,t.numeroLicencia,t.idLicencia,t.expedicion,t.vigencia, t.nacionalidad,t.numeroSeguro, t.fechaIngreso,t.idUsuario,s.razonSocial
                FROM conductores t
                INNER JOIN empresas s ON t.idLicencia = s.idEmrpesa`, (error, resultado, fields) => {

            next(error, resultado)
        })
}
function getconductoresByEmpresa(idEmrpesa, next) {
    ConductorModel
        .query(`SELECT t.nombres, t.apellidos, t.idConductor,t.curp,t.direccion,t.categoria,t.base,t.numeroLicencia,t.idLicencia,t.expedicion,t.vigencia, t.nacionalidad,t.numeroSeguro, t.fechaIngreso,t.idUsuario
                FROM conductores t
                WHERE t.idLicencia = ?`, idEmrpesa , (error, resultado, fields) => {

            next(error, resultado)
        })
}
module.exports = {
    getConductorById,
    getConductoresNameByLicense,
    getConductores,
    getAllIdConductor,
    getconductoresByLicense,
    createConductor,
    updateConductor,
    deleteConductor,
    getIdConductorByName,
    getNamesOfConductor,
    getconductoresByEmpresa,
    getConductores2,
    getConductoresNameByEmpresa,
    getConductor2ById

}
