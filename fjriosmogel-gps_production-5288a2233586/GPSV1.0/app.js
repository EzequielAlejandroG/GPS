/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'

const express = require('express'),
    bodyParser = require('body-parser'),
    pug = require('pug'),
    restFul = require('method-override')('_method'),
    config = require('./config'),
    cookieSession = require("cookie-session"),
    Index = require('./controllers/index'),
    User_router = require('./routes/usuario'),
    Sucursal_router = require('./routes/sucursal'),
    Tecnica_router = require('./routes/tecnica'),
    Ruta_router = require('./routes/ruta'),
    State_router = require('./routes/estado'),
    Priority_router = require('./routes/prioridad'),
    Service_router = require('./routes/servicio'),
    License_router = require('./routes/licencia'),
    Company_router = require('./routes/empresa'),
    Location_router = require('./routes/ubicacion'),
    Truck_router = require('./routes/camion'),
    Trailer_router = require('./routes/remolque'),
    Statu_router = require('./routes/estadu'),
    Customer_router = require('./routes/cliente'),
    Conductor_router = require('./routes/conductor'),
    Category_router = require('./routes/categoria'),
    Router_product = require('./routes/producto'),
    Almacen_router = require('./routes/almacen'),
    Consumo_router = require('./routes/consumo'),
    Basico_router = require('./routes/basico'),
    Router_historial = require('./routes/historial'),
    session_admin = require('./middleware/session-admin'),
    session_general_admin = require('./middleware/session-general-admin'),
    session_active = require('./middleware/session-active'),
    session_active_sucursal = require('./middleware/session-active-sucursal'),
    app = express()

app
    // configuracion app
    .set("view engine","pug")
    .set('views', config.VIEWS)
    .set('port',config.PORT)
    // ejecutando middleware
    .use( config.PUBLIC, express.static('public') )
    // parse application/json
    .use( bodyParser.json())
    // parse applicaction/x-www-form-urlencoded
    .use( bodyParser.urlencoded({extended:false}) )
    // para put y delete
    .use( restFul )
    .use(cookieSession({
        name: "session",
        keys: ["gelish","time"]
    }))
// Mogelfluidos/
app
    .get('/', Index.index )
    .get('/login', Index.loginGet )
    .post('/login', Index.loginPost )
    .get('/logout', Index.logout )
// Mogelfluidos/almacen
app
    .use("/almacen",session_active)
    .use("/almacen",Almacen_router)
// Mogelfluidos/consumos
app
    .use("/consumos",session_active)
    .use("/consumos",Consumo_router)
// Mogelfluidos/basicos
app
    .use("/basicos",session_active_sucursal)
    .use("/basicos",Basico_router)
// Mogelfluidos/users
app
    .use("/users", session_admin )
    .use('/users', User_router )
// Mogelfluidos/tecnicas
app
    .use("/tecnicas", session_admin )
    .use('/tecnicas', Tecnica_router )
// Mogelfluidos/sucursales
app
    .use("/sucursales", session_general_admin )
    .use('/sucursales', Sucursal_router )
// Mogelfluidos/categories
app
    .use("/categories", session_general_admin )
    .use('/categories', Category_router )
// Mogelfluidos/products
app
    .use("/products",session_general_admin)
    .use("/products",Router_product)
// Mogelfluidos/historial
app
    .use("/historial",session_admin)
    .use("/historial",Router_historial)
    // Mogelfluidos/states
app
    .use("/states", session_general_admin )
    .use('/states', State_router )
      // Mogelfluidos/customers
app
    .use("/customers", session_general_admin )
    .use('/customers', Customer_router )
    // Mogelfluidos/status
app
    .use("/status", session_general_admin )
    .use('/status', Statu_router )
    // Mogelfluidos/business
app
    .use("/business", session_general_admin )
    .use('/business', Company_router )
    // Mogelfluidos/trailers
app
    .use("/trailers", session_general_admin )
    .use('/trailers', Trailer_router )
    // Mogelfluidos/priorities
app
    .use("/priorities", session_general_admin )
    .use('/priorities', Priority_router )
    // Mogelfluidos/services
app
    .use("/services", session_general_admin )
    .use('/services', Service_router )
     // Mogelfluidos/services
app
    .use("/licenses", session_general_admin )
    .use('/licenses', License_router )
    // Mogelfluidos/conductores
app
    .use("/conductores", session_general_admin )
    .use('/conductores', Conductor_router )
    // Mogelfluidos/locations
app
    .use("/locations", session_general_admin )
    .use('/locations', Location_router )
 // Mogelfluidos/locations
app
    .use("/trucks", session_general_admin )
    .use('/trucks', Truck_router )    
// Mogelfluidos/rutas
app
    .use("/rutas", session_general_admin )
    .use('/rutas', Ruta_router )        
      // Mogelfluidos/customers
    // para error 404
    .use( Index.error404 )

module.exports = app