const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM ruta', (err, ruta) => {
     if (err) {
      res.json(err);
     }
     res.render('ruta', {
        data: ruta
     });
    });
  });
};


controller.mapa = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query('SELECT * FROM ruta', (err, ruta) => {
     if (err) {
      res.json(err);
     }
     res.render('ruta', {
        data: ruta
     });
    });
  });
};

module.exports = controller;
