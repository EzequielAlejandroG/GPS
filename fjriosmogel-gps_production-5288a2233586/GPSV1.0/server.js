/**
 * Creared by Luis Vazquez Ramirez on 15/08/2019.
 */
'use strict'
const app = require('./app')
// servidor ejecutandose
app.listen(app.get('port'), () => {
    console.log(`Aplicacion corriendo en el puerto ${app.get('port')}`)
})