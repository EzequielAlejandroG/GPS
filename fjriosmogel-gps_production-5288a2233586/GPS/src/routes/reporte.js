const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/reporte', (req, res) => {
    res.render('reporte/reporte');
});

router.get('/', isLoggedIn, async (req, res) => {
    const servicio = await pool.query('SELECT * FROM servicio');
    res.render('reporte/reporte', { servicio });
});

module.exports = router;