const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('ruta/add');
});

router.get('/report', (req, res) => {
    res.render('ruta/report');
});

router.get('/mapa', (req, res) => {
    res.render('ruta/mapa');
});

router.post('/add', async (req, res) => {
    const { idruta, idVehiculo, id_remolque, start, end, id_operador, id_usuario, fecha_salida, hora_salida, fecha_llegada, hora_llegada, tiempo_estimado, create_at, id_prioridad, descripcion } = req.body;
    const newRuta = {
        idVehiculo,
        id_remolque,
        start,
        end,
        id_operador,
        id_usuario: req.user.id,
        fecha_salida,
        hora_salida,
        fecha_llegada,
        hora_llegada,
        tiempo_estimado,
        create_at,
        id_prioridad,
        descripcion,
    };
    await pool.query('INSERT INTO ruta set ?', [newRuta]);
    req.flash('success','Route Saved Successfully');
    res.redirect('/ruta');
});

router.get('/', isLoggedIn, async (req, res) => {
    const ruta = await pool.query('SELECT * FROM ruta');
    res.render('ruta/list', { ruta });
});

router.get('/', isLoggedIn, async (req, res) => {
    const ruta = await pool.query('SELECT * FROM ruta where idruta!="" ');
    res.render('ruta/list', { ruta });
});

router.get('/delete/:idruta', async (req, res) => {
    const { idruta } = req.params;
    await pool.query('DELETE FROM ruta WHERE IDRUTA = ?', [idruta]);
    req.flash('success', 'route removed successfully');
    res.redirect('/ruta');
});

router.get('/report/:idruta', async (req, res) => {
    const { idruta } = req.params;
    const ruta = await pool.query('SELECT * FROM ruta WHERE idruta = ?', [idruta]);
    console.log(ruta);
    res.render('ruta/report', {ruta: ruta[0]});
});

router.get('/mapa/:idruta', async (req, res) => {
    const { idVehiculo } = req.params;
    const ruta = await pool.query('SELECT * FROM ruta WHERE idruta = ?', [idruta]);
    console.log(ruta);
    res.render('ruta/mapa', {ruta: ruta[0]});
});

router.post('/edit/:idruta', async (req, res) => {
    const { idruta } = req.params;
    const { idVehiculo, id_remolque, start, end, id_operador, id_usuario, fecha_salida, hora_salida, fecha_llegada, hora_llegada, tiempo_estimado, create_at, id_prioridad, descripcion } = req.body;
    const newRuta = {
        idVehiculo,
        id_remolque,
        start,
        end,
        id_operador,
        id_usuario: req.user.id,
        fecha_salida,
        hora_salida,
        fecha_llegada,
        hora_llegada,
        tiempo_estimado,
        create_at,
        id_prioridad,
        descripcion,
    };
    await pool.query('UPDATE ruta set ? WHERE idruta = ?', [newRuta, idruta]);
    req.flash('success', 'route updated Successfully');
    res.redirect('/ruta');
});

module.exports = router;