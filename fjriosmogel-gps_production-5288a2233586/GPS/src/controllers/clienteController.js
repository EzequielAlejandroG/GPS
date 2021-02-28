const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM cliente', (err, cliente) => {
     if (err) {
      res.json(err);
     }
     res.render('cliente', {
        data: cliente
     });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO cliente set ?', data, (err, cliente) => {
      console.log(cliente)
      res.render('cliente_add')
    });
  });
};

controller.edit = (req, res) => {
  const { idcliente } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM cliente WHERE idcliente = ?", [idcliente], (err, rows) => {
      res.render('cliente_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { idcliente } = req.params;
  const newCliente = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE cliente set ? where idcliente = ?', [newCliente, idcliente], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { idcliente } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM cliente WHERE idcliente = ?', [idcliente], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
