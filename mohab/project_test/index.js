const UserRouter = require('./routes/users')
const PostRouter = require('./routes/posts')
const mongoose = require('mongoose')
const express = require('express')

const app = express()
app.use(express.json()) //to read data from body to json
//must 
app.set('view engins','ejs') //know the engin 
app.set('views','views')// to set configuration and let him know the View 

//middlewares
//auth middleware / check for spesific things to allow continue
// app.use((req,res,next)=>{ // === must use return to break the execution of a function ===
//     const auth = req.headers.authorization
//     if(!auth) return next(new Error('Unauthorized')) // I throw error for error cacher down
//     else next()
// })
// if next('error') law katbt 7aga inside next = throw new Error(string) 
//exept (route,router)=> to skip all middleware
//middleware example
// app.use((req,res,next)=>{  // to intrupt the req
//     console.log(req.method, req.path,new Date())
//     next()
// })
//app.use(express.urlencoded()) // parse req body if url encoded
//app.use(express.static("public")) // for static access any pic or img or vedio
// بقا طلبات الصور والكلام ده منفصل عن الhtml

app.use("/users",UserRouter) // changed "/users" da hawadeny 3ala el Routesers 3altol
app.use("/posts",PostRouter) // changed "/posts" da hawadeny 3ala el Routesers 3altol


mongoose.connect("mongodb://localhost:27017/blogApp", {
    useUnifiedTopology: true,
    useNewUrlParser: true,
    autoReconnect: true,
},(err)=>{
    if (err) return console.log(err)
    console.log("connected to database")
})




app.use((err,req,res,next)=>{ // to catch all errors before it
    console.log(err)
    res.status(500).send('Error happend')
})
app.listen(9000, (err)=>{
    if(err) return console.log(err);
    else console.log('started on server 3000')
})