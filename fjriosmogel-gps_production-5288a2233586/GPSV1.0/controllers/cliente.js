/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const CustomerModel = require('../models/cliente'),
      Utilidad = require('../ayuda/utilidad')

function customersGet(req, res) {
    // busco todos los clientes
    CustomerModel.getCustomers( (error, clientes) => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al obtener los clientes: ${error}`, tipo: 0})
        ) : (
            res.render('./customers/manager', { clientes, usuario: req.session.user })
        )
    })
}

function customersNewGet(req, res) {
    res.render('./customers/new', { usuario: req.session.user })
}

function customersNewPost(req, res) {
    // creo la nueva cliente
    let nuevaCliente = {
        razonSocial: req.body.razonSocial,
        rfc: req.body.rfc,
        domicilioFiscal: req.body.domicilioFiscal,
        status: req.body.status,
        idUsuario: req.body.idUsuario
        
    }
    // guardo la nueva cliente
    CustomerModel.createCustomer(nuevaCliente, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al agregar el nuevo cliente: ${error}`, tipo: 1})
        ) : (
            res.json({msg:"",tipo:3})
        )
    })
}

function customersIdCustomerGet(req, res) {
    let idCustomer = req.params.idCliente
    // busco la cliente 
    CustomerModel.getCustomerById(idCustomer, (error, customerUpdate) => { // si no hubo error
        if(error){
            Utilidad.printError(res, { msg: `Error al obtener el cliente: ${error}`, tipo: 0})
        }else{
            ( comprobarCliente(customerUpdate) ) ? (
                res.render('./customers/update', { usuario: req.session.user, customerUpdate })
            ) : (
                res.redirect('/customers')
            ) 
        }
    })
    
}

function customersIdCustomerPut(req, res) {
    let clienteUpdate = {
        idCliente: req.params.idCliente,
        razonSocial: req.body.razonSocial,
        rfc: req.body.rfc,
        domicilioFiscal: req.body.domicilioFiscal,
        status: req.body.status,
        idUsuario: req.body.idUsuario
        
    }
    // actualizo la cliente en la base de datos
    CustomerModel.updateCustomer(clienteUpdate, error => { // si no hubo error
        (error) ? (
            Utilidad.printError(res, { msg: `Error al actualizar el cliente: ${error}`, tipo: 1})
        ) : (
            //res.redirect('/customer')
            res.json({msg:"",tipo:3})
        )
    })
}

function customersIdCustomerDelete(req, res) {
    let idCliente = req.params.idCliente
    // borramos la cliente
    CustomerModel.deleteCustomer(idCliente, error => {
        if(error) Utilidad.printError(res, {msg:`Error al borrar el cliente`, tipo: 0})
        res.redirect('/customers')
    })
}

function comprobarCliente(cliente){
    try {
        return cliente.idCliente != null
    } catch (error) {
        return false
    }
    
}

module.exports = {
    customersGet,
    customersNewGet,
    customersNewPost,
    customersIdCustomerGet,
    customersIdCustomerPut,
    customersIdCustomerDelete
}