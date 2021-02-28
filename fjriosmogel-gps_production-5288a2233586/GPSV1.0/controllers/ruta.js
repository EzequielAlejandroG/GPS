/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const RutaModel = require('../models/ruta'),
      Utilidad = require('../ayuda/utilidad')

function rutasGet(req, res) {
    // busco todos los rutas
    RutaModel.getRutas( (error, rutas) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los rutas: ${error}`, tipo: 0})
        ) : (
            res.render('./rutas/manager', { rutas, usuario: req.session.user })
        )
    })
}

function rutasNewGet(req, res) {
    res.render('./rutas/new', { usuario: req.session.user })
}

function rutasNewPost(req, res) {
    // creo la nueva ruta
    let nuevaRuta = {
        idVehiculo: req.body.idVehiculo,
        noEconomico: req.body.noEconomico,
        idRemolque: req.body.idRemolque,
        salida: req.body.salida,
        destino: req.body.destino,
        idConductor: req.body.idConductor,
        fechaSalida: req.body.fechaSalida,
        fechaLlegada: req.body.fechaLlegada,
        tiempoEstimado: req.body.tiempoEstimado,
        idPrioridad: req.body.idPrioridad,
        idEstado: req.body.idEstado,
        idUsuario: req.session.user.idUsuario,
        
    }
    // guardo la nueva ruta
    RutaModel.createRuta(nuevaRuta, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo ruta: ${error}`, tipo: 1})
        ) : (
            res.redirect('/rutas')
            //res.json({msg:"",tipo:3})
        )
    })
}

function rutasIdRutaGet(req, res) {
    let idRuta = req.params.idRuta
    // busco la ruta 
    RutaModel.getRutaById(idRuta, (error, rutaUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el ruta: ${error}`, tipo: 0})
        }else{
            ( comprobarRuta(rutaUpdate) ) ? (
                res.render('./rutas/waypoint', { usuario: req.session.user, rutaUpdate })
            ) : (
                res.redirect('/rutas')
            ) 
        }
    })
    
}

function rutas2IdRutaGet(req, res) {
    let idRuta2 = req.params.idRuta2
    // busco la ruta 
    RutaModel.getRuta2ById(idRuta2, (error,ruta2Update) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el ruta: ${error}`, tipo: 0})
        }else{
            ( comprobarRuta(ruta2Update) ) ? (
                res.render('./rutas/waypoint', { usuario: req.session.user, ruta2Update })
            ) : (
                res.redirect('/rutas')
            ) 
        }
    })
    
}
function rutas2IdRutaPut(req, res) {    
    let ruta2Update = {
        idRuta2: req.params.idRuta2,
        idVehiculo: req.body.idVehiculo,
        idRemolque: req.body.idRemolque,
        salida: req.body.salida,
        destino: req.body.destino,
        idConductor: req.body.idConductor,
        fechaSalida: req.body.fechaSalida,
        fechaLlegada: req.body.fechaLlegada,
        tiempoEstimado: req.body.tiempoEstimado,
        idPrioridad: req.body.idPrioridad,
        idEstado: req.body.idEstado,
        idUsuario: req.session.user.idUsuario,
    }
    // actualizo la ruta en la base de datos
    RutaModel.UpdateRuta2(ruta2Update, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la ruta: ${error}`, tipo: 1})
        ) : (
            res.redirect('/rutas')
            //res.json({msg:"",tipo:3})
        )
    })
}
 
function rutasIdRutaPut(req, res) {
    let rutaUpdate = {
        idRuta: req.params.idRuta,
        noEconomico: req.params.noEconomico,
        idVehiculo: req.body.idVehiculo,
        idRemolque: req.body.idRemolque,
        salida: req.body.salida,
        destino: req.body.destino,
        idConductor: req.body.idConductor,
        fechaSalida: req.body.fechaSalida,
        fechaLlegada: req.body.fechaLlegada,
        tiempoEstimado: req.body.tiempoEstimado,
        idPrioridad: req.body.idPrioridad,
        idEstado: req.body.idEstado,
        idUsuario: req.session.user.idUsuario,
    }
    // actualizo la ruta en la base de datos
    RutaModel.updateRuta(rutaUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar la ruta: ${error}`, tipo: 1})
        ) : (
            res.redirect('/rutas')
            //res.json({msg:"",tipo:3})
        )
    })
}

function rutasIdRutaDelete(req, res) {
    let idRuta = req.params.idRuta
    // borramos la ruta
    RutaModel.deleteRuta(idRuta, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el ruta`, tipo: 0})
        res.redirect('/rutas')
    })
}

function comprobarRuta(ruta){
    try {
        return ruta.idRuta != null
    } catch (error) {
        return false
    }
    
}

function comprobarRuta2(ruta2){
    try {
        return ruta2.idRuta2 != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    rutasGet,
    rutasNewGet,
    rutasNewPost,
    rutasIdRutaGet,
    rutas2IdRutaGet,
    rutasIdRutaPut,
    rutas2IdRutaPut,
    rutasIdRutaDelete
}