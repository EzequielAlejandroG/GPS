const express = require('express');
const router = express.Router();
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');
const helpers = require('../lib/helpers');

router.get('/add', (req, res) => {
    res.render('users/add');
});


router.post('/add', async (req, res) => {
    const { username, password, fullname, email, creat_at, profile_pic, is_active } = req.body;
   const newUsers = {
       id,
       username,
       password,
       fullname,
       email,
       creat_at,
       profile_pic,
       is_active
    };
    await pool.query('INSERT INTO users set ?', [newUsers]);
    req.flash('success', 'User Saved Successfully');
    res.redirect('/users');
});

router.get('/', isLoggedIn, async (req, res) => {
    const users = await pool.query('SELECT * FROM users');
    res.render('users/list', { users });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query('DELETE FROM users WHERE id = ?', [id]);
    req.flash('success', 'User Removed Successfully');
    res.redirect('/users');
});

router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const users = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
    console.log(users);
    res.render('users/edit', {users: users[0]});
});

router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { username, password, fullname, email, profile_pic, is_active } = req.body; 
    const newUsers = {
       id,
       username,
       password,
       fullname,
       email,
       profile_pic,
       is_active
    };
    await pool.query('UPDATE users set ? WHERE id = ?', [newUsers, id]);
     req.flash('success', 'User Updated Successfully');
    res.redirect('/users');
});


module.exports = router;