/**
 * Created by Raul Perez on 12/04/2017.
 */
'use strict'

const PriorityModel = require('../models/prioridad'),
      Utilidad = require('../ayuda/utilidad')

function prioritiesGet(req, res) {
    // busco todos los prioridades
    PriorityModel.getPriorities( (error, prioridades) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los prioridades: ${error}`, tipo: 0})
        ) : (
            res.render('./priorities/manager', { prioridades, usuario: req.session.user })
        )
    })
}

function prioritiesNewGet(req, res) {
    res.render('./priorities/new', { usuario: req.session.user })
}

function prioritiesNewPost(req, res) {
    // creo la nueva prioridad
    let nuevaPrioridad = {
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario
    }
    // guardo la nueva Prioridad
    PriorityModel.createPriority(nuevaPrioridad, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo prioridade: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function prioritiesIdPriorityGet(req, res) {
    let idPriority = req.params.idPrioridad
    // busco la Prioridad 
    PriorityModel.getPriorityById(idPriority, (error, priorityUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el prioridad: ${error}`, tipo: 0})
        }else{
            ( comprobarPrioridad(priorityUpdate) ) ? (
                res.render('./priorities/update', { usuario: req.session.user, priorityUpdate })
            ) : (
                res.redirect('/priorities')
            ) 
        }
    })
    
}

function prioritiesIdPriorityPut(req, res) {
    let prioridadUpdate = {
        idPrioridad: req.params.idPrioridad,
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario
    }
    // actualizo la Prioridad en la base de datos
    PriorityModel.updatePriority(prioridadUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la Prioridad: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/priorities')
            res.json({msg:"",tipo:3})
        )
    })
}

function prioritiesIdPriorityDelete(req, res) {
    let idPrioridad = req.params.idPrioridad
    // borramos la Prioridad
    PriorityModel.deletePriority(idPrioridad, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el Prioridad`, tipo: 0})
        res.redirect('/priorities')
    })
}

function comprobarPrioridad(prioridad){
    try {
        return prioridad.idPrioridad != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    prioritiesGet,
    prioritiesNewGet,
    prioritiesNewPost,
    prioritiesIdPriorityGet,
    prioritiesIdPriorityPut,
    prioritiesIdPriorityDelete
}