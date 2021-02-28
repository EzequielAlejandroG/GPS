/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const CompanyModel = require('./coneccion')

function getCompanyById(idCompany, next) {
    CompanyModel
        .query(`SELECT * 
                FROM empresas 
                WHERE idEmpresa = ?`, idCompany, (error, resultado, fields) => {

            next(error, resultado[0])
        })
}

function getIdCompanyByName(raz, next) {
    CompanyModel
        .query(`SELECT c.idEmpresa 
                FROM empresas c 
                WHERE c.razonSocial = ?`, raz, (error, resultado, fields) => {

            (typeof resultado[0] === 'undefined') ? next(error, null) : next(error, resultado[0].idEmpresa)
        })
}

function getBusiness(next) {
    CompanyModel
        .query(`SELECT * 
                FROM empresas` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function getNamesOfBusiness(next) {
    CompanyModel
        .query(`SELECT c.razonSocial 
                FROM empresas c` , (error, resultado, fields) => {

            next(error, resultado)
        })
}

function createCompany(company, next) {
    CompanyModel
        .query(`INSERT INTO empresas
                SET ?`, company, (error, resultado, fields) => {

            next(error)
        })
}

function updateCompany(company, next) {
    CompanyModel
        .query(`UPDATE empresas 
                SET ? 
                WHERE idEmpresa = ?`, [company,company.idEmpresa], (error, resultado, fields) => {

            next(error)
        })
}

function deleteCompany(idEmpresa, next) {
    CompanyModel
        .query(`DELETE FROM empresas 
                WHERE idEmpresa = ?`, idEmpresa, (error, resultado, fields) => {

            next(error)
        })
}

module.exports = {
    getCompanyById,
    getIdCompanyByName,
    getBusiness,
    getNamesOfBusiness,
    createCompany,
    updateCompany,
    deleteCompany
}