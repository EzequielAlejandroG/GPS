const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('cliente/add');
});

router.get('/add', (req, res) => {
    res.render('cliente/add');
});

router.post('/add', async (req, res) => {
    const { idcliente,razonsocial,rfc,domicilio_fiscal,status } = req.body;
    const newCliente = {
        idcliente,
        razonsocial,
        rfc,
        domicilio_fiscal,
        status,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO cliente set ?', [newCliente]);
    req.flash('success', 'Cleint Saved Successfully');
    res.redirect('/cliente');
});

router.get('/', isLoggedIn, async (req, res) => {
    const cliente = await pool.query('SELECT * FROM cliente');
    res.render('cliente/list', { cliente });
});

router.get('/delete/:idcliente', async (req, res) => {
    const { idcliente } = req.params;
    await pool.query('DELETE FROM cliente WHERE idcliente = ?', [idcliente]);
    req.flash('success', 'client Removed Successfully');
    res.redirect('/cliente');
});

router.get('/edit/:idcliente', async (req, res) => {
    const { idcliente } = req.params;
    const cliente = await pool.query('SELECT * FROM cliente WHERE idcliente = ?', [idcliente]);
    console.log(cliente);
    res.render('cliente/edit', {cliente: cliente[0]});
});

router.post('/edit/:idcliente', async (req, res) => {
    const { idcliente } = req.params;
    const { razonsocial,rfc,domicilio_fiscal,status } = req.body; 
    const newCliente = {
        idcliente,
        razonsocial,
        rfc,
        domicilio_fiscal,
        status,
    };
    await pool.query('UPDATE cliente set ? WHERE idcliente = ?', [newCliente, idcliente]);
    req.flash('success', 'client Updated Successfully');
    res.redirect('/cliente');
});

module.exports = router;