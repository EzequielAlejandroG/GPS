const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM licencia', (err, licencia) => {
     if (err) {
      res.json(err);
     }
     res.render('licencia', {
        data: licencia
     });
    });
  });
};


controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO licencia set ?', data, (err, licencia) => {
      console.log(licencia)
      res.render('licencia_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM licencia WHERE id = ?", [id], (err, rows) => {
      res.render('licencia_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newLicencia = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE licencia set ? where id = ?', [newLicencia, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM licencia WHERE id = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
