const controller = {};

controller.option = (req, res) => {
  req.getConnection((err, conn) => {
conn.query('SELECT id, name from category',(err, operador) =>{
  if (err) {
    res.json(err);
  }
  res.render('operador', {
    data: operador;
  })
});
});
};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM operador', (err, operador) => {
     if (err) {
      res.json(err);
     }
     res.render('operador', {
        data: operador
     });
    });
  });
};


controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO operador set ?', data, (err, operador) => {
      console.log(operador)
      res.render('operador_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id_operador } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM operador WHERE id_operador = ?", [id_operador], (err, rows) => {
      res.render('operador_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id_operador } = req.params;
  const newOperador = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE operador set ? where id_operador = ?', [newOperador, id_operador], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id_operador } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM operador WHERE id_operador = ?', [id_operador], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
