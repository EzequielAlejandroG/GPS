/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const ConductorModel = require('../models/conductor'),
      LicenseModel = require('../models/licencia'),
      CompanyModel = require('../models/empresa'),
      ProductModel = require('../models/producto'),
      BasicoModel = require('../models/basico'),
      Utilidad = require('../ayuda/utilidad')

function conductoresGet(req, res) {
    let usuario = req.session.user

    if( usuario.permisos === 2 ){ // si es administrador general
        // busco todas las conductores
        ConductorModel.getConductores( (error, conductores) => {
            (error) ? ( // si hubo error
                Utilidad.printError(res, { msg: `Error al obtener las conductores: ${error}`, tipo: 0 })
            ) : ( // si no hubo error
                res.render('./conductores/manager', { usuario, conductores } )
            )
        })
    } else { // si es administrador de licencia
        // busco todas las conductores
        ConductorModel.getConductoresByLicense(usuario.idLicense, (error, conductores) => {
            (error) ? ( // si hubo error
                Utilidad.printError(res, { msg: `Error al obtener las conductores: ${error}`, tipo: 0 })
            ) : ( // si no hubo error
                res.render('./conductores/manager', { usuario, conductores } )
            )
        })
    }
}

function conductoresNewGet(req, res) {
    let usuario = req.session.user

    if( usuario.permisos === 2 ){ // si es administrador general
        // busco las licencias
         LicenseModel.getNamesOfLicenses( (error, licenses) => { // si no hubo error
            (error) ? (
                Utilidad.printError(res, { msg: `Error al buscar las licencias: ${error}`, tipo: 0})
            ) : (
                res.render('./conductores/new', { usuario, licenses })
            )
        })
    } else { // si es administrador de licencia
    
}
}

function conductoresNewPost(req, res) {
    let usuario = req.session.user,
        nombres= req.body.nombres
    
    if( usuario.permisos === 2 ){ // si es administrador general
        // busco la licencia
        LicenseModel.getIdLicenseByName(nombres, (error, idLicense) => { // si no hubo error
            if(error){
                Utilidad.printError(res, { msg: `Error al buscar la licencia: ${error}`, tipo: 0})
                return
            }
            // creamos la nueva conductor
            let nuevaConductor = {      
                nombres: req.body.nombres,
                apellidos: req.body.apellidos,
                curp: req.body.curp,
                direccion: req.body.direccion,
                categoria: req.body.categoria,
                base: req.body.base,
                numeroLicencia: req.body.numeroLicencia,
                expedicion: req.body.expedicion, 
                vigencia: req.body.vigencia,
                nacionalidad: req.body.nacionalidad, 
                numeroSeguro: req.body.numeroSeguro,
                fechaIngreso: req.body.fechaIngreso,    
                idUsuario: req.session.user.idUsuario,
                idLicenses
            }
            // guardamos a la nueva conductor
            createConductor(res, nuevaConductor)
        })
    } else { // si es administrador de licencia
        // creamos la nueva conductor
        let nuevaConductor = {
            nombres: req.body.nombres,
            apellidos: req.body.apellidos,
            curp: req.body.curp,
            direccion: req.body.direccion,
            categoria: req.body.categoria,
            base: req.body.base,
            numeroLicencia: req.body.numeroLicencia, 
            expedicion: req.body.expedicion, 
            vigencia: req.body.vigencia,
            nacionalidad: req.body.nacionalidad, 
            numeroSeguro: req.body.numeroSeguro,
            fechaIngreso: req.body.fechaIngreso,    
            idUsuario: req.session.user.idUsuario,
            idLicencia: req.body.idLicencia
            
        }
        createConductor(res, nuevaConductor)
    }
}

function conductoresIdConductorGet(req, res) {
    let usuario = req.session.user,
        idConductor = req.params.idConductor

    if( usuario.permisos === 2 ){ // si es administrador general
        // busco las licencias
        LicenseModel.getNamesOfLicenses( (error, licenses) => { // si no hubo error
            if(error){
                Utilidad.printError(res, { msg: `Error al obtener las licencias: ${error}`, tipo: 0})
                return
            }
            // busco la conductor a editar
            ConductorModel.getConductorById(idConductor, (error, conductorUpdate) => { // si no hubo error
                (error) ? (
                    Utilidad.printError(res, { msg: `Error al obtener la conductor: ${error}`, tipo: 0})
                ) : (
                    (
                        res.redirect('/conductores')
                    )
                    
                )
            })
        })
    } else { // si es administrador de licencia
        // busco la conductor a editar
        ConductorModel.getConductorById(idConductor, (error, conductorUpdate) => { // si no hubo error
            (error) ? (
                Utilidad.printError(res, { msg: `Error al obtener la conductor: ${error}`, tipo: 0})
            ) : (
                (comprobarConductor(conductorUpdate, usuario)) ? (
                    res.render('./conductores/update', { usuario, conductorUpdate })
                ) : (
                    res.redirect('/conductores')
                )
            )
        })
    }
}

function conductoresIdConductorPut(req, res) {
    let usuario = req.session.user,
        idConductor = req.params.idConductor,
        nombre = req.body.nombre

    if( usuario.permisos === 2 ){ // si es administrador general
        // busco las licencias
        LicenseModel.getIdLicenseByNombre(nombre, (error, idLicense) => { // si no hubo error
            if(error){
                Utilidad.printError(res, { msg: `Error al obtener las licencias: ${error}`, tipo: 0})
                return
            }
            // edito la conductor
            let conductorUpdate = {
                idConductor,
                nombres:req.body.nombres,
                apellidos:req.body.apellidos,
                curp:req.body.curp,
                direccion:req.body.direccion,
                categoria:req.body.categoria,
                base:req.body.base,
                numeroLicencia:req.body.numeroLicencia,
                expedicion:req.body.expedicion,
                vigencia:req.body.vigencia,
                nacionalidad:req.body.nacionalidad,
                numeroSeguro:req.body.numeroSeguro,
                fechaIngreso:req.body.fechaIngreso,
                idUsuario: req.session.user.idUsuario,
                idLicense: req.body.idLicense
            }
            // actualizo la conductor en la base de datos
            updateConductor(res, conductorUpdate)
        })
    } else { // si es administrador de licencia
        // edito la conductor
        let conductorUpdate = {
            idConductor,
            nombres:req.body.nombres,
            apellidos:req.body.apellidos,
            curp:req.body.curp,
            direccion:req.body.direccion,
            categoria:req.body.categoria,
            base:req.body.base,
            numeroLicencia:req.body.numeroLicencia,
            expedicion:req.body.expedicion,
            vigencia:req.body.vigencia,
            nacionalidad:req.body.nacionalidad,
            numeroSeguro:req.body.numeroSeguro,
            fechaIngreso:req.body.fechaIngreso,
            idLicense: req.body.idLicense,
            idUsuario: req.session.user.idUsuario
        }
        // actualizo la conductor en la base de datos
        updateConductor(res, conductorUpdate)
    }
}

function createConductor(res, conductor) {
    // guardamos a la nueva conductor
    ConductorModel.createConductor(conductor, error => {
        if(error){
            Utilidad.printError(res, { msg: `Error al guardar el nuevo conductor: ${error}`, tipo: 0})
            return
        }
        res.redirect('/conductores')
    })
}

function updateConductor(res, conductor) {
    ConductorModel.updateConductor(conductor, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar conductor: ${error}`, tipo: 0})
        ) : (
            res.redirect('/conductores')
        )
    })
}



function conductoresIdConductorDelete(req, res) {
    let idConductor = req.params.idConductor
    // borramos el conductor
    ConductorModel.deleteConductor(idConductor, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el conductor`, tipo: 0})
        res.redirect('/conductores')
    })
}

module.exports = {
    conductoresGet,
    conductoresNewGet,
    conductoresNewPost,
    conductoresIdConductorGet,
    conductoresIdConductorPut,
    conductoresIdConductorDelete
}
