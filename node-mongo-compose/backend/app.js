const express = require('express')
const restful = require('node-restful')
const server = express()
const mongoose = restful.mongoose 
const bodyParser = require('body-parser')
const cors = require('cors')


//database 
mongoose.Promise = global.Promise // fala pro mogoose usar a api de promise do node, pq a dele esta deprecada
mongoose.connect('mongodb://db/mydb')

// Middlewares
server.use(bodyParser.urlencoded({extended:true}))
server.use(bodyParser.json())
server.use(cors())


// ODM 
const Client = restful.model('Client', {
		name: {type: String, required: true}
})


//Rest API
Client.methods(['get','post', 'put', 'delete'])
Client.updateOptions({new:true, runValidators:true})
Client.register(server, '/clients')


//Start server
server.listen(3000)

