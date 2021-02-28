const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('operador/add');
});


router.post('/add', async (req, res) => {
    const { id_operador,nombre,categoria,base,tipo_licencia,vigencia,numero_seguro,fecha_ingreso,fecha_baja } = req.body;
    const newOperador = {
        id_operador,
        nombre,
        categoria,
        base,
        tipo_licencia,
        vigencia,
        numero_seguro,
        fecha_ingreso,
        fecha_baja,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO operador set ?', [newOperador]);
    req.flash('success', 'driver Saved Successfully');
    res.redirect('/operador');
});

router.get('/', isLoggedIn, async (req, res) => {
    const operador = await pool.query('SELECT * FROM operador');
    res.render('operador/list', { operador });
});

router.get('/delete/:id_operador', async (req, res) => {
    const { id_operador } = req.params;
    await pool.query('DELETE FROM operador WHERE id_operador = ?', [id_operador]);
    req.flash('success', 'driver Removed Successfully');
    res.redirect('/operador');
});

router.get('/edit/:id_operador', async (req, res) => {
    const { id_operador } = req.params;
    const operador = await pool.query('SELECT * FROM operador WHERE id_operador = ?', [id_operador]);
    console.log(operador);
    res.render('operador/edit', {operador: operador[0]});
});

router.post('/edit/:id_operador', async (req, res) => {
    const { id_operador } = req.params;
    const { nombre,categoria,base,tipo_licencia,vigencia,numero_seguro,fecha_ingreso,fecha_baja } = req.body; 
    const newOperador = {
        id_operador,
        nombre,
        categoria,
        base,
        tipo_licencia,
        vigencia,
        numero_seguro,
        fecha_ingreso,
        fecha_baja,
    };
    await pool.query('UPDATE operador set ? WHERE id_operador = ?', [newOperador, id_operador]);
     req.flash('success', 'Driver Updated Successfully');
    res.redirect('/operador');
});


module.exports = router;