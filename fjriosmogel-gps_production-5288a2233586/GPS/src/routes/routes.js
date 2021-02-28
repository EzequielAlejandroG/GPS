'use strict'

const express = require('express')
const routes = express.Router()
const controller = require('../controllers/controller')
const fetch = require('node-fetch')

let array = []

routes.post('/pdf', controller.ConvertBodyToPDF)
routes.get('/data', controller.JSON_Generate)

routes.get('/report', (req, res) => {
  res.render('ubicacion/report', { title: 'HTML to PDF', data: array })
})

routes.get('/', (req, res) => {
  res.redirect('/report')
})

module.exports = routes