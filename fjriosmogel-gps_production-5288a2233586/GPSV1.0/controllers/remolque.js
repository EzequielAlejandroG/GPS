/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const TrailerModel = require('../models/remolque'),
      Utilidad = require('../ayuda/utilidad')

function trailersGet(req, res) {
    // busco todos los remolques
    TrailerModel.getTrailers( (error, remolques) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener las remolques: ${error}`, tipo: 0})
        ) : (
            res.render('./trailers/manager', { remolques, usuario: req.session.user })
        )
    })
}

function trailersNewGet(req, res) {
    res.render('./trailers/new', { usuario: req.session.user })
}

function trailersNewPost(req, res) {
    // creo la nueva remolque
    let nuevaRemolque = {
        nombre: req.body.nombre,
        placas: req.body.placas,
        idUsuario: req.session.user.idUsuario,
        
    }
    // guardo la nueva remolque
    TrailerModel.createTrailer(nuevaRemolque, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo remolque: ${error}`, tipo: 1})
        ) : (
           res.redirect('/trailers')
        )
    })
}

function trailersIdTrailerGet(req, res) {
    let idTrailer = req.params.idRemolque
    // busco la remolque 
    TrailerModel.getTrailerById(idTrailer, (error, trailerUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el remolque: ${error}`, tipo: 0})
        }else{
            ( comprobarRemolque(trailerUpdate) ) ? (
                res.render('./trailers/update', { usuario: req.session.user, trailerUpdate })
            ) : (
                res.redirect('/trailers')
            ) 
        }
    })
    
}

function trailersIdTrailerPut(req, res) {
    let remolqueUpdate = {
        idRemolque: req.params.idRemolque,
        nombre: req.body.nombre,
        placas: req.body.placas,
        idUsuario: req.session.user.idUsuario,
        
    }
    // actualizo la remolque en la base de datos
    TrailerModel.updateTrailer(remolqueUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar el remolque: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/Trailer')
            res.redirect('/trailers')
        )
    })
}

function trailersIdTrailerDelete(req, res) {
    let idRemolque = req.params.idRemolque
    // borramos la remolque
    TrailerModel.deleteTrailer(idRemolque, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el remolque`, tipo: 0})
        res.redirect('/trailers')
    })
}

function comprobarRemolque(remolque){
    try {
        return remolque.idRemolque != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    trailersGet,
    trailersNewGet,
    trailersNewPost,
    trailersIdTrailerGet,
    trailersIdTrailerPut,
    trailersIdTrailerDelete
}