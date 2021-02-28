const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const validator = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');
const fileUpload = require('express-fileupload');
const busboy = require('then-busboy');
const { database } = require('./keys');
const ejs = require('ejs')

// Intializations
const app = express();
require('./lib/passport');

// Settings
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: require('./lib/handlebars')
}))
app.set('view engine', '.hbs');

// Middlewares
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(fileUpload());

app.use(session({
  secret: 'faztmysqlnodemysql',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(validator());

// Global variables
app.use((req, res, next) => {
  app.locals.message = req.flash('message');
  app.locals.success = req.flash('success');
  app.locals.user = req.user;
  next();
});

// Routes
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));
app.use('/links', require('./routes/links'));
app.use('/ubicacion', require('./routes/ubicacion'));
app.use('/estados', require('./routes/estados'));
app.use('/cliente', require('./routes/cliente'));
app.use('/operador', require('./routes/operador'));
app.use('/licencia', require('./routes/licencia'));
app.use('/category', require('./routes/category'));
app.use('/servicio', require('./routes/servicio'));
app.use('/empresa', require('./routes/empresa'));
app.use('/priority', require('./routes/priority'));
app.use('/remolque', require('./routes/remolque'));
app.use('/reporte', require('./routes/reporte'));
app.use('/camiones', require('./routes/camiones'));
app.use('/users', require('./routes/users'));
app.use('/ruta', require('./routes/ruta'));




// Public
app.use(express.static(path.join(__dirname, 'public')));
 
// Starting
app.listen(app.get('port'), () => {
  console.log('Server is in port', app.get('port'));
});
