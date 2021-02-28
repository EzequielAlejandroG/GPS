/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const CompanyModel = require('../models/empresa'),
      Utilidad = require('../ayuda/utilidad')

function businessGet(req, res) {
    // busco todos los empresas
    CompanyModel.getBusiness( (error, empresas) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener las empresas: ${error}`, tipo: 0})
        ) : (
            res.render('./business/manager', { empresas, usuario: req.session.user })
        )
    })
}

function businessNewGet(req, res) {
    res.render('./business/new', { usuario: req.session.user })
}

function businessNewPost(req, res) {
    // creo la nueva empresa
    let nuevaEmpresa = {
        razonSocial: req.body.razonSocial,
        rfc: req.body.rfc,
        domicilioFiscal: req.body.domicilioFiscal,
        status: req.body.status,
        idUsuario: req.session.user.idUsuario,
        
    }
    // guardo la nueva empresa
    CompanyModel.createCompany(nuevaEmpresa, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo empresa: ${error}`, tipo: 1})
        ) : (
            alert("se agrego correctamente")
        )
    })
}

function businessIdCompanyGet(req, res) {
    let idCompany = req.params.idEmpresa
    // busco la empresa 
    CompanyModel.getCompanyById(idCompany, (error, companyUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el empresa: ${error}`, tipo: 0})
        }else{
            ( comprobarEmpresa(companyUpdate) ) ? (
                res.render('./business/update', { usuario: req.session.user, companyUpdate })
            ) : (
                res.redirect('/business')
            ) 
        }
    })
    
}

function businessIdCompanyPut(req, res) {
    let empresaUpdate = {
        idEmpresa: req.params.idEmpresa,
        razonSocial: req.body.razonSocial,
        rfc: req.body.rfc,
        domicilioFiscal: req.body.domicilioFiscal,
        status: req.body.status,
        idUsuario: req.session.user.idUsuario,
        
    }
    // actualizo la empresa en la base de datos
    CompanyModel.updateCompany(empresaUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar el empresa: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/Company')
            res.redirect('/business')
        )
    })
}

function businessIdCompanyDelete(req, res) {
    let idEmpresa = req.params.idEmpresa
    // borramos la empresa
    CompanyModel.deleteCompany(idEmpresa, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el empresa`, tipo: 0})
        res.redirect('/business')
    })
}

function comprobarEmpresa(empresa){
    try {
        return empresa.idEmpresa != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    businessGet,
    businessNewGet,
    businessNewPost,
    businessIdCompanyGet,
    businessIdCompanyPut,
    businessIdCompanyDelete
}