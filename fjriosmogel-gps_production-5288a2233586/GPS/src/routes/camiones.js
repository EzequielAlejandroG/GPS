const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('ubicacion/add');
});

router.get('/mapa', (req, res) => {
    res.render('ubicacion/mapa');
});

router.get('/', isLoggedIn, async (req, res) => {
    const ubicacion = await pool.query('SELECT * FROM ubicacion where placa!="" ');
    res.render('ubicacion/list', { ubicacion });
});

router.get('/delete/:idVehiculo', async (req, res) => {
    const { idVehiculo } = req.params;
    await pool.query('DELETE FROM ubicacion WHERE ID = ?', [idVehiculo]);
    req.flash('success', 'ubicacion Removed Successfully');
    res.redirect('/ubicacion');
});

router.get('/mapa/:idVehiculo', async (req, res) => {
    const { idVehiculo } = req.params;
    const ubicacion = await pool.query('SELECT * FROM ubicacion WHERE idVehiculo = ?', [idVehiculo]);
    console.log(ubicacion);
    res.render('ubicacion/mapa', {ubicacion: ubicacion[0]});
});

router.post('/edit/:idVehiculo', async (req, res) => {
    const { idVehiculo } = req.params;
    const { placa, longitud, latitud, geoPunto} = req.body; 
    const newUbicacion = {
        placa,
        longitud,
        latitud,
        GeoPunto,
    };
    await pool.query('UPDATE ubicacion set ? WHERE idVehiculo = ?', [newUbicacion, idVehiculo]);
    req.flash('success', 'ubicacion Updated Successfully');
    res.redirect('/ubicacion');
});

module.exports = router;