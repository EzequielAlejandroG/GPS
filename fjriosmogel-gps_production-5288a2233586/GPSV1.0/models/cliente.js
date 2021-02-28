/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const CustomerModel = require('./coneccion')

function getCustomerById(idCustomer, next) {
    CustomerModel
        .query(`SELECT * 
                FROM clientes 
                WHERE idCliente = ?`, idCustomer, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdCustomerByName(raz, next) {
    CustomerModel
        .query(`SELECT c.idCliente 
                FROM clientes c 
                WHERE c.razonSocial = ?`, raz, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idCliente)
        })
}

function getCustomers(next) {
    CustomerModel
        .query(`SELECT * 
                FROM clientes` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfCustomers(next) {
    CustomerModel
        .query(`SELECT c.razonSocial 
                FROM clientes c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createCustomer(customer, next) {
    CustomerModel
        .query(`INSERT INTO clientes
                SET ?`, customer, (error, resultado, fields) => {

            next(error)
        })
}

function updateCustomer(customer, next) {
    CustomerModel
        .query(`UPDATE clientes 
                SET ? 
                WHERE idCliente = ?`, [customer,customer.idCliente], (error, resultado, fields) => {

            next(error)
        })
}

function deleteCustomer(idCliente, next) {
    CustomerModel
        .query(`DELETE FROM clientes 
                WHERE idCliente = ?`, idCliente , (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getCustomerById,
    getIdCustomerByName,
    getCustomers,
    getNamesOfCustomers,
    createCustomer,
    updateCustomer,
    deleteCustomer
}