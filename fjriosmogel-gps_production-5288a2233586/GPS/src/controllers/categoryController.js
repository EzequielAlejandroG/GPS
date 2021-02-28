const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM category', (err, category) => {
     if (err) {
      res.json(err);
     }
     res.render('category', {
        data: category
     });
    });
  });
};


controller.save = (req, res) => {
  const data = req.body;
  console.log(req.body)
  req.getConnection((err, connection) => {
    const query = connection.query('INSERT INTO category set ?', data, (err, category) => {
      console.log(category)
      res.render('category_add')
    });
  });
};

controller.edit = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM category WHERE id = ?", [id], (err, rows) => {
      res.render('category_edit', {
        data: rows[0]
      })
    });
  });
};

controller.update = (req, res) => {
  const { id } = req.params;
  const newCategory = req.body;
  req.getConnection((err, conn) => {

  conn.query('UPDATE category set ? where id = ?', [newCategory, id], (err, rows) => {
    res.redirect('/');
  });
  });
};

controller.delete = (req, res) => {
  const { id } = req.params;
  req.getConnection((err, connection) => {
    connection.query('DELETE FROM category WHERE id = ?', [id], (err, rows) => {
      res.redirect('/');
    });
  });
}

module.exports = controller;
