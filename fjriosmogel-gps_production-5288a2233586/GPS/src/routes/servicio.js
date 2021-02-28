const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('servicio/add');
});

router.get('/add', (req, res) => {
    res.render('servicio/add');
});

router.post('/add', async (req, res) => {
    const { descripcion } = req.body;
    const newServicio = {
        descripcion,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO servicio set ?', [newServicio]);
    req.flash('success','service Saved Successfully');
    res.redirect('/servicio');
});

router.get('/', isLoggedIn, async (req, res) => {
    const servicio = await pool.query('SELECT * FROM servicio');
    res.render('servicio/list', { servicio });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM servicio WHERE id = ?', [id]);
    req.flash('success','service Removed Successfully');
    res.redirect('/servicio');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const servicio = await pool.query('SELECT * FROM servicio WHERE id = ?', [id]);
    console.log(servicio);
    res.render('servicio/edit', {servicio: servicio[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { descripcion } = req.body; 
    const newServicio = {
        descripcion,
    };
    await pool.query('UPDATE servicio set ? WHERE id = ?', [newServicio, id]);
    req.flash('success', 'service Updated Successfully');
    res.redirect('/servicio');
});

module.exports = router;