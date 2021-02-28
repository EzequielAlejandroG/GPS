const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM ubicacion', (err, ubicacion) => {
     if (err) {
      res.json(err);
     }
     res.render('ubicacion', {
        data: ubicacion
     });
    });
  });
};


controller.mapa = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM ubicacion', (err, ubicacion) => {
     if (err) {
      res.json(err);
     }
     res.render('ubicacion', {
        data: ubicacion
     });
    });
  });
};

module.exports = controller;
