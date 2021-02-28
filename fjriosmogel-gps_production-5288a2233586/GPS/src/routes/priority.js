const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('priority/add');
});

router.post('/add', async (req, res) => {
    const { name } = req.body;
    const newPriority = {
        name,
        user_id: req.user.id,
    };
    await pool.query('INSERT INTO priority set ?', [newPriority]);
    req.flash('success','priority Saved Successfully');
    res.redirect('/priority');
});

router.get('/', isLoggedIn, async (req, res) => {
    const priority = await pool.query('SELECT * FROM priority');
    res.render('priority/list', { priority });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM priority WHERE id = ?', [id]);
    req.flash('success','priority Removed Successfully');
    res.redirect('/priority');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const priority = await pool.query('SELECT * FROM priority WHERE id = ?', [id]);
    console.log(priority);
    res.render('priority/edit', {priority: priority[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { name } = req.body; 
    const newPriority = {
        name,
    };
    await pool.query('UPDATE priority set ? WHERE id = ?', [newPriority, id]);
    req.flash('success', 'priority Updated Successfully');
    res.redirect('/priority');
});

module.exports = router;