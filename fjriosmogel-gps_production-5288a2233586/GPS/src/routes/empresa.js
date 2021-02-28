const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('empresa/add');
});

router.post('/add', async (req, res) => {
    const { razonsocial, rfc, domicilio_fiscal } = req.body;
    const newEmpresa = {
        razonsocial,
        rfc,
        domicilio_fiscal,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO empresa set ?', [newEmpresa]);
    req.flash('success', 'company Saved Successfully');
    res.redirect('/empresa');
});

router.get('/', isLoggedIn, async (req, res) => {
    const empresa = await pool.query('SELECT * FROM empresa');
    res.render('empresa/list', { empresa });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM empresa WHERE id = ?', [id]);
    req.flash('success', 'company Removed Successfully');
    res.redirect('/empresa');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const empresa = await pool.query('SELECT * FROM empresa WHERE id = ?', [id]);
    console.log(empresa);
    res.render('empresa/edit', {empresa: empresa[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { razonsocial, rfc, domicilio_fiscal } = req.body; 
    const newEmpresa = {
        razonsocial,
        rfc,
        domicilio_fiscal,
    };
    await pool.query('UPDATE empresa set ? WHERE id = ?', [newEmpresa, id]);
    req.flash('success', 'company Updated Successfully');
    res.redirect('/empresa');
});

module.exports = router;