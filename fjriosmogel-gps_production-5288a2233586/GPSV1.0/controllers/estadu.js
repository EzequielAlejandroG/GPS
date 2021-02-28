/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const StatuModel = require('../models/estadu'),
      Utilidad = require('../ayuda/utilidad')

function statusGet(req, res) {
    // busco todos los estadus
    StatuModel.getStatus( (error, estadus) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los estados: ${error}`, tipo: 0})
        ) : (
            res.render('./status/manager', { estadus, usuario: req.session.user })
        )
    })
}

function statusNewGet(req, res) {
    res.render('./status/new', { usuario: req.session.user })
}

function statusNewPost(req, res) {
    // creo la nueva estadu
    let nuevaEstadu = {
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario,
    }
    // guardo la nueva estadu
    StatuModel.createStatu(nuevaEstadu, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo estado: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function statusIdStatuGet(req, res) {
    let idStatu = req.params.idEstado
    // busco la estado 
    StatuModel.getStatuById(idStatu, (error, statuUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el estado: ${error}`, tipo: 0})
        }else{
            ( comprobarEstadu(statuUpdate) ) ? (
                res.render('./status/update', { usuario: req.session.user, statuUpdate })
            ) : (
                res.redirect('/status')
            ) 
        }
    })
    
}

function statusIdStatuPut(req, res) {
    let estaduUpdate = {
        idEstado: req.params.idEstado,
        nombre: req.body.nombre,
        descripcion: req.body.descripcion,
        idUsuario: req.session.user.idUsuario,
    }
    // actualizo la estado en la base de datos
    StatuModel.updateStatu(estaduUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la estado: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/status')
            res.json({msg:"",tipo:3})
        )
    })
}

function statusIdStatuDelete(req, res) {
    let idEstado = req.params.idEstado
    // borramos la estado
    StatuModel.deleteStatu(idEstado, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el estado`, tipo: 0})
        res.redirect('/status')
    })
}

function comprobarEstadu(estadu){
    try {
        return estadu.idEstado != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    statusGet,
    statusNewGet,
    statusNewPost,
    statusIdStatuGet,
    statusIdStatuPut,
    statusIdStatuDelete
}