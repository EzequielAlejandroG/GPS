const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM priority', (err, priority) => {
     if (err) {
      res.json(err);
     }
     res.render('priority', {
        data: priority
     });
    });
  });
};


controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO priority set ?', data, (err, priority) => {
      console.log(priority)
      res.render('priority_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM priority WHERE id = ?", [id], (err, rows) => {
      res.render('priority_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newPriority = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE priority set ? where id = ?', [newPriority, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM priority WHERE id = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
