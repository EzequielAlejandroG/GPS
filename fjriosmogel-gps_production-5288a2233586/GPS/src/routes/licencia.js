const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('licencia/add');
});

router.get('/add', (req, res) => {
    res.render('licencia/add');
});

router.post('/add', async (req, res) => {
    const { tipo, descripcion } = req.body;
    const newLicencia = {
        tipo,
        descripcion,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO licencia set ?', [newLicencia]);
    req.flash('success', 'license Saved Successfully');
    res.redirect('/licencia');
});

router.get('/', isLoggedIn, async (req, res) => {
    const licencia = await pool.query('SELECT * FROM licencia');
    res.render('licencia/list', { licencia });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM licencia WHERE id = ?', [id]);
    req.flash('success', 'license Removed Successfully');
    res.redirect('/licencia');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const licencia = await pool.query('SELECT * FROM licencia WHERE id = ?', [id]);
    console.log(licencia);
    res.render('licencia/edit', {licencia: licencia[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { tipo,descripcion } = req.body; 
    const newLicencia = {
        tipo,
        descripcion,

    };
    await pool.query('UPDATE licencia set ? WHERE id = ?', [newLicencia, id]);
    req.flash('success', 'license Updated Successfully');
    res.redirect('/licencia');
});

module.exports = router;