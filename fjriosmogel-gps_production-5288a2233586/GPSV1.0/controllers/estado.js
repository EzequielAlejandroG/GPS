/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const StateModel = require('../models/estado'),
      Utilidad = require('../ayuda/utilidad')

function statesGet(req, res) {
    // busco todos los estados
    StateModel.getStates( (error, estados) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los estados: ${error}`, tipo: 0})
        ) : (
            res.render('./states/manager', { estados, usuario: req.session.user })
        )
    })
}

function statesNewGet(req, res) {
    res.render('./states/new', { usuario: req.session.user })
}

function statesNewPost(req, res) {
    // creo la nueva estado
    let nuevaEstado = {
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario,
    }
    // guardo la nueva estado
    StateModel.createState(nuevaEstado, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo estado: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function statesIdStateGet(req, res) {
    let idState = req.params.idEstado
    // busco la estado 
    StateModel.getStateById(idState, (error, stateUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el estado: ${error}`, tipo: 0})
        }else{
            ( comprobarEstado(stateUpdate) ) ? (
                res.render('./states/update', { usuario: req.session.user, stateUpdate })
            ) : (
                res.redirect('/states')
            ) 
        }
    })
    
}

function statesIdStatePut(req, res) {
    let estadoUpdate = {
        idEstado: req.params.idEstado,
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario,
    }
    // actualizo la estado en la base de datos
    StateModel.updateState(estadoUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la estado: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/states')
            res.json({msg:"",tipo:3})
        )
    })
}

function statesIdStateDelete(req, res) {
    let idEstado = req.params.idEstado
    // borramos la estado
    StateModel.deleteState(idEstado, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el estado`, tipo: 0})
        res.redirect('/states')
    })
}

function comprobarEstado(estado){
    try {
        return estado.idEstado != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    statesGet,
    statesNewGet,
    statesNewPost,
    statesIdStateGet,
    statesIdStatePut,
    statesIdStateDelete
}