const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('estados/add');
});

router.get('/add', (req, res) => {
    res.render('estados/add');
});

router.post('/add', async (req, res) => {
    const { nombre } = req.body;
    const newEstado = {
        nombre,
    };
    await pool.query('INSERT INTO estados set ?', [newEstado]);
    req.flash('success', 'estate Saved Successfully');
    res.redirect('/estados');
});

router.get('/', isLoggedIn, async (req, res) => {
    const estados = await pool.query('SELECT * FROM estados');
    res.render('estados/list', { estados });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM estados WHERE ID = ?', [id]);
    req.flash('success', 'state Removed Successfully');
    res.redirect('/estados');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const estados = await pool.query('SELECT * FROM estados WHERE id = ?', [id]);
    console.log(estados);
    res.render('estados/edit', {estados: estados[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { nombre } = req.body; 
    const newEstado = {
        nombre,

    };
    await pool.query('UPDATE estados set ? WHERE id = ?', [newEstado, id]);
    req.flash('success', 'estate Updated Successfully');
    res.redirect('/estados');
});




module.exports = router;