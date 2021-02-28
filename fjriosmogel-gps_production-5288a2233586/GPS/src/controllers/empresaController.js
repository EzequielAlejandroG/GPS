const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM empresa', (err, empresa) => {
     if (err) {
      res.json(err);
     }
     res.render('empresa', {
        data: empresa
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO empresa set ?', data, (err, empresa) => {
      console.log(empresa)
      res.render('empresa_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM empresa WHERE id = ?", [id], (err, rows) => {
      res.render('empresa_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newEmpresa = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE empresa set ? where id = ?', [newEmpresa, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM empresa WHERE id = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
