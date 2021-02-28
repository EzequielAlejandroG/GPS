/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const ServiceModel = require('../models/servicio'),
      Utilidad = require('../ayuda/utilidad')

function servicesGet(req, res) {
    // busco todos los servicios
    ServiceModel.getServices( (error, servicios) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los servicios: ${error}`, tipo: 0})
        ) : (
            res.render('./services/manager', { servicios, usuario: req.session.user })
        )
    })
}

function servicesNewGet(req, res) {
    res.render('./services/new', { usuario: req.session.user })
}

function servicesNewPost(req, res) {
    // creo la nueva servicio
    let nuevaServicio = {
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario
    }
    // guardo la nueva Servicio
    ServiceModel.createService(nuevaServicio, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo servicio: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function servicesIdServiceGet(req, res) {
    let idService = req.params.idServicio
    // busco la Servicio 
    ServiceModel.getServiceById(idService, (error, serviceUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el servicio: ${error}`, tipo: 0})
        }else{
            ( comprobarServicio(serviceUpdate) ) ? (
                res.render('./services/update', { usuario: req.session.user, serviceUpdate })
            ) : (
                res.redirect('/services')
            ) 
        }
    })
    
}

function servicesIdServicePut(req, res) {
    let servicioUpdate = {
        idServicio: req.params.idServicio,
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario
    }
    // actualizo la Servicio en la base de datos
    ServiceModel.updateService(servicioUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la servicio: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/services')
            res.json({msg:"",tipo:3})
        )
    })
}

function servicesIdServiceDelete(req, res) {
    let idServicio = req.params.idServicio
    // borramos la servicio
    ServiceModel.deleteService(idServicio, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el servicio`, tipo: 0})
        res.redirect('/services')
    })
}

function comprobarServicio(servicio){
    try {
        return servicio.idServicio != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    servicesGet,
    servicesNewGet,
    servicesNewPost,
    servicesIdServiceGet,
    servicesIdServicePut,
    servicesIdServiceDelete
}