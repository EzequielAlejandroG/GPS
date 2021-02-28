
/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const TruckModel = require('../models/camion'),
      Utilidad = require('../ayuda/utilidad')

function trucksGet(req, res) {
    // busco todos los ubicacions
    TruckModel.getTrucks( (error, camiones) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener las camiones: ${error}`, tipo: 0})
        ) : (
            res.render('./trucks/manager', { camiones, usuario: req.session.user })
        )
    })
}

function trucksNewGet(req, res) {
    res.render('./trucks/new', { usuario: req.session.user })
}

function trucksNewPost(req, res) {
    // creo la nueva camion
    let nuevaCamion = {
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
    // guardo la nueva camion
    TruckModel.createTruck(nuevaCamion, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo camion: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function trucksIdTruckGet(req, res) {
    let idTruck = req.params.placa
    // busco la camion 
    truckModel.gettruckById(idTruck, (error, truckUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el camion: ${error}`, tipo: 0})
        }else{
            ( comprobarCamion(truckUpdate) ) ? (
                res.render('./trucks/update', { usuario: req.session.user, truckUpdate })
            ) : (
                res.redirect('/trucks')
            ) 
        }
    })
    
}

function trucksIdTruckPut(req, res) {
    let camionUpdate = {
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
    // actualizo la camion en la base de datos
    truckModel.updatetruck(camionUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar el camion: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/truck')
            res.json({msg:"",tipo:3})
        )
    })
}

function trucksIdTruckDelete(req, res) {
    let placa = req.params.placa
    // borramos la camion
    TruckModel.deleteTruck(placa, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el camion`, tipo: 0})
        res.redirect('/trucks')
    })
}

function comprobarCamion(camion){
    try {
        return camion.placa != null
    } catch (error) {
        return false
    }
}
    


module.exports = {
    trucksGet,
    trucksNewGet,
    trucksNewPost,
    trucksIdTruckGet,
    trucksIdTruckPut,
    trucksIdTruckDelete
}