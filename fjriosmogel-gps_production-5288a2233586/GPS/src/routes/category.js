const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', (req, res) => {
    res.render('category/add');
});

router.get('/add', (req, res) => {
    res.render('category/add');
});

router.post('/add', async (req, res) => {
    const { name } = req.body;
    const newCategory = {
        name,
         user_id: req.user.id,
    };
    await pool.query('INSERT INTO category set ?', [newCategory]);
    req.flash('success','category Saved Successfully');
    res.redirect('/category');
});

router.get('/', isLoggedIn, async (req, res) => {
    const category = await pool.query('SELECT * FROM category');
    res.render('category/list', { category });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM category WHERE id = ?', [id]);
    req.flash('success','category Removed Successfully');
    res.redirect('/category');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const category = await pool.query('SELECT * FROM category WHERE id = ?', [id]);
    console.log(category);
    res.render('category/edit', {category: category[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { name } = req.body; 
    const newCategory = {
        name,
    };
    await pool.query('UPDATE category set ? WHERE id = ?', [newCategory, id]);
    req.flash('success', 'category Updated Successfully');
    res.redirect('/category');
});

module.exports = router;