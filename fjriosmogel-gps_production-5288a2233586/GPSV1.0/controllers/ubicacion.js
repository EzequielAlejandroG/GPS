
/**
 *Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const LocationModel = require('../models/ubicacion'),
      Utilidad = require('../ayuda/utilidad')

function locationsGet(req, res) {
    // busco todos los ubicacions
    LocationModel.getLocations( (error, ubicaciones) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener las ubicaciones: ${error}`, tipo: 0})
        ) : (
            res.render('./locations/manager', { ubicaciones, usuario: req.session.user })
        )
    })
}

function locationsNewGet(req, res) {
    res.render('./locations/new', { usuario: req.session.user })
}

function locationsNewPost(req, res) {
    // creo la nueva ubicacion
    let nuevaUbicacion = {
        tipoPosicion: req.body.tipoPosicion,
        estadoMotor: req.body.estadoMotor,               
        fechaParcialRespuesta: req.body.fechaParcialRespuesta,     
        tiempoParcialRespuesta: req.body.tiempoParcialRespuesta,    
        anoParcialRespuesta: req.body.anoParcialRespuesta,       
        mesParcialRespuesta: req.body.mesParcialRespuesta,       
        diaSemanaRespuesta: req.body.diaSemanaRespuesta,        
        geoPunto: req.body.geoPunto,                 
        idVehiculo: req.body.idVehiculo,                
        idCobertura: req.body.idCobertura,               
        idCliente: req.body.idCliente,                 
        idEquipo: req.body.idEquipo,                  
        idTipoVehiculo: req.body.idTipoVehiculo,            
        latitud: req.body.latitud,                         
        longitud: req.body.longitud,                  
        velocidad: req.body.velocidad,                 
        curso: req.body.curso,                     
        fechaPosicion: req.body.fechaPosicion,             
        fechaRespuesta: req.body.fechaRespuesta,            
        kilometraje: req.body.kilometraje,               
        fechaPosicionHcm: req.body.fechaPosicionHcm,          
        idTrayecto: req.body.idTrayecto,                
        notificacion: req.body.notificacion,              
        idNotificacion: req.body.idNotificacion,            
        argumentoNotificacion: req.body.argumentoNotificacion,     
        noSerie: req.body.noSerie,                   
        placa: req.body.placa,                     
        noEconomico: req.body.noEconomico,              
        idServicio: req.body.idServicio,                
        idTipoPosicion: req.body.idTipoPosicion,            
        estadoGeoreferencia: req.body.estadoGeoreferencia,       
        municipioGeoreferencia: req.body.municipioGeoreferencia,    
        asentamientoGeoreferencia: req.body.asentamientoGeoreferencia, 
        direccionGeoreferencia: req.body.direccionGeoreferencia    
                
    }
    // guardo la nueva ubicacion
    LocationModel.createLocation(nuevaUbicacion, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo ubicacion: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function locationsIdLocationGet(req, res) {
    let idLocation = req.params.placa
    // busco la ubicacion 
    LocationModel.getLocationById(idLocation, (error, locationUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el ubicacion: ${error}`, tipo: 0})
        }else{
            ( comprobarUbicacion(locationUpdate) ) ? (
                res.render('./locations/update', { usuario: req.session.user, locationUpdate })
            ) : (
                res.redirect('/locations')
            ) 
        }
    })
    
}

function locationsIdLocationPut(req, res) {
    let ubicacionUpdate = {
        tipoPosicion: req.params.tipoPosicion,
        estadoMotor: req.params.estadoMotor,               
        fechaParcialRespuesta: req.params.fechaParcialRespuesta,     
        tiempoParcialRespuesta: req.params.tiempoParcialRespuesta,    
        anoParcialRespuesta: req.params.anoParcialRespuesta,      
        mesParcialRespuesta: req.params.mesParcialRespuesta,       
        diaSemanaRespuesta: req.params.diaSemanaRespuesta,        
        geoPunto: req.params.geoPunto,                 
        idVehiculo: req.params.idVehiculo,                
        idCobertura: req.params.idCobertura,               
        idCliente: req.params.idCliente,                 
        idEquipo: req.params.idEquipo,                  
        idTipoVehiculo: req.params.idTipoVehiculo,            
        latitud: req.params.latitud,                   
        longitud: req.params.longitud,                  
        velocidad: req.params.velocidad,                 
        curso: req.params.curso,                     
        fechaPosicion: req.params.fechaPosicion,             
        fechaRespuesta: req.params.fechaRespuesta,            
        kilometraje: req.params.kilometraje,               
        fechaPosicionHcm: req.params.fechaPosicion,          
        idTrayecto: req.params.idTrayecto,                
        notificacion: req.params.notificacion,              
        idNotificacion: req.params.idNotificacion,            
        argumentoNotificacion: req.params.argumentoNotificacion,     
        noSerie: req.params.noSerie,                   
        placa: req.params.placa,                     
        noEconomico: req.params.noEconomico,              
        idServicio: req.params.idServicio,                
        idTipoPosicion: req.params.idTipoPosicion,            
        estadoGeoreferencia: req.params.estadoGeoreferencia,       
        municipioGeoreferencia: req.params.municipioGeoreferencia,    
        asentamientoGeoreferencia: req.params.asentamientoGeoreferencia, 
        direccionGeoreferencia: req.params.direccionGeoreferencia  
               
    }
    // actualizo la ubicacion en la base de datos
    LocationModel.updateLocation(ubicacionUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar el ubicacion: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/Location')
            res.json({msg:"",tipo:3})
        )
    })
}

function locationsIdLocationDelete(req, res) {
    let placa = req.params.placa
    // borramos la ubicacion
    LocationModel.deleteLocation(placa, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el ubicacion`, tipo: 0})
        res.redirect('/locations')
    })
}

function comprobarUbicacion(ubicacion){
    try {
        return ubicacion.placa != null
    } catch (error) {
        return false
    }
}
    


module.exports = {
    locationsGet,
    locationsNewGet,
    locationsNewPost,
    locationsIdLocationGet,
    locationsIdLocationPut,
    locationsIdLocationDelete
}