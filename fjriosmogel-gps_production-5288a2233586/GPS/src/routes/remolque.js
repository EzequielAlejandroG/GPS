const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('remolque/add');
});

router.post('/add', async (req, res) => {
    const { nombre,placas } = req.body;
    const newRemolque = {
        nombre,
        placas,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO remolque set ?', [newRemolque]);
    req.flash('success','trailer Saved Successfully');
    res.redirect('/remolque');
});

router.get('/', isLoggedIn, async (req, res) => {
    const remolque = await pool.query('SELECT * FROM remolque');
    res.render('remolque/list', { remolque });
});


router.get('/', isLoggedIn, async (req, res) => {
    const remolque = await pool.query('SELECT COUNT(*) FROM remolque');
    res.render('remolque/list', { remolque });
});

router.get('/delete/:id_remolque', async (req, res) => {
    const { id_remolque } = req.params;
    await pool.query('DELETE FROM remolque WHERE id_remolque = ?', [id_remolque]);
    req.flash('success','trailer Removed Successfully');
    res.redirect('/remolque');
});

router.get('/edit/:id_remolque', async (req, res) => {
    const { id_remolque } = req.params;
    const remolque = await pool.query('SELECT * FROM remolque WHERE id_remolque = ?', [id_remolque]);
    console.log(remolque);
    res.render('remolque/edit', {remolque: remolque[0]});
});

router.post('/edit/:id_remolque', async (req, res) => {
    const { id_remolque } = req.params;
    const { nombre,placas } = req.body; 
    const newRemolque = {
        nombre,
        placas,
    };
    await pool.query('UPDATE remolque set ? WHERE id_remolque = ?', [newRemolque, id_remolque]);
    req.flash('success', 'trailer Updated Successfully');
    res.redirect('/remolque');
});

module.exports = router;