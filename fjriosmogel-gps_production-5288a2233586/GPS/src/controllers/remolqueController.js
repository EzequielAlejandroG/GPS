const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM remolque', (err, remolque) => {
     if (err) {
      res.json(err);
     }
     res.render('remolque', {
        data: remolque
     });
    });
  });
};


controller.search = (req, res) => {
  const { id_remolque } = req.params;
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM remolque WHERE id_remolque = ?', [id_remolque], (err, remolque) => {
     if (err) {
      res.json(err);
     }
     res.render('remolque', {
        data: remolque
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO remolque set ?', data, (err, remolque) => {
      console.log(remolque)
      res.render('remolque_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id_remolque } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM remolque WHERE id_remolque = ?", [id_remolque], (err, rows) => {
      res.render('remolque_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id_remolque } = req.params;
  const newRemolque = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE remolque set ? where id_remolque = ?', [newRemolque, id_remolque], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id_remolque } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM remolque WHERE id_remolque = ?', [id_remolque], (err, rows) => {
      res.redirect('/');
    });
  });
}

controller.count = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT COUNT(*) FROM remolque', (err, remolque) => {
     if (err) {
      res.json(err);
     }
     res.render('remolque', {
        data: remolque
     });
    });
  });
};


module.exports = controller;
