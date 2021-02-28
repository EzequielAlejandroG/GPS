const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM estados', (err, ubicacion) => {
     if (err) {
      res.json(err);
     }
     res.render('estados', {
        data: estados
     });
    });
  });
};


controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO estados set ?', data, (err, ubicacion) => {
      console.log(estados)
      res.render('estados_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM estados WHERE id = ?", [id], (err, rows) => {
      res.render('estados_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newEstado = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE estados set ? where id = ?', [newEstado, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM estados WHERE id = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
