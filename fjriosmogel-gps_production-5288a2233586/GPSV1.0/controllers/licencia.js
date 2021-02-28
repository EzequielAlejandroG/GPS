/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const LicenseModel = require('../models/licencia'),
      Utilidad = require('../ayuda/utilidad')

function licensesGet(req, res) {
    // busco todos los licencias
    LicenseModel.getLicenses( (error, licencias) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los licencias: ${error}`, tipo: 0})
        ) : (
            res.render('./licenses/manager', { licencias, usuario: req.session.user })
        )
    })
}

function licensesNewGet(req, res) {
    res.render('./licenses/new', { usuario: req.session.user })
}

function licensesNewPost(req, res) {
    // creo la nueva licencia
    let nuevaLicencia = {
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario
    }
    // guardo la nueva Licencia
    LicenseModel.createLicense(nuevaLicencia, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo licencia: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function licensesIdLicenseGet(req, res) {
    let idLicense = req.params.idLicencia
    // busco la licencia 
    LicenseModel.getLicenseById(idLicense, (error, licenseUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el licencia: ${error}`, tipo: 0})
        }else{
            ( comprobarLicencia(licenseUpdate) ) ? (
                res.render('./licenses/update', { usuario: req.session.user, licenseUpdate })
            ) : (
                res.redirect('/licenses')
            ) 
        }
    })
    
}

function licensesIdLicensePut(req, res) {
    let licenciaUpdate = {
        idLicencia: req.params.idLicencia,
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario
    }
    // actualizo la licencia en la base de datos
    LicenseModel.updateLicense(licenciaUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la licencia: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/licenses')
            res.json({msg:"",tipo:3})
        )
    })
}

function licensesIdLicenseDelete(req, res) {
    let idLicencia = req.params.idLicencia
    // borramos la licencia
    LicenseModel.deleteLicense(idLicencia, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el licencia`, tipo: 0})
        res.redirect('/licenses')
    })
}

function comprobarLicencia(licencia){
    try {
        return licencia.idLicencia != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    licensesGet,
    licensesNewGet,
    licensesNewPost,
    licensesIdLicenseGet,
    licensesIdLicensePut,
    licensesIdLicenseDelete
}