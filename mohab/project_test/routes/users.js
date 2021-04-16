const express = require('express')
const Router = express.Router() // object to add some routes on it and export it to the app
const mongoose = require('mongoose')
const UserModel = require('../models/user')

//middleware before Router 
// Router.use((req,res,next)=>{
//     //logic
//     console.log("in user Router")
//     next()
// })

Router.get("",(req, res)=>{
    const id = req.params.id  // any parameters from link
    // console.log(req.query.x)  // any value after ? like => localhost:3000/users/9?x=2
    //res.status(200)           // to change status there is many actions with response on slides
    UserModel.find({}, (err, data)=>{
        if (err) return console.log("error getting the Data")
        else res.render("./users.ejs", {users: data})
    })
})

Router.get("/:id",(req, res)=>{
    const id = req.params.id  // any parameters from link
    // console.log(req.query.x)  // any value after ? like => localhost:3000/users/9?x=2
    //res.status(200)           // to change status there is many actions with response on slides
    // res.send(`you are looking for user id ${id} with GET Method`) // send string we can render too
    // userModel.find({},(err,))

    UserModel.findById(id, (err, data)=>{
        if (err) return console.log("error getting the Data")
        else {
            // console.log(data.getFullName())
            res.send(data)
        }
    })
})

Router.post("", (req, res)=>{
    const id = req.params.id  // any parameters from link
    const user = req.body
    console.log(user) //Json file on postmen to save on db
    var UserInstance = new UserModel(req.body)
    UserInstance.save().then(item => {
      res.status(200).send("item saved to database");
    }).catch(err => {
        res.status(400).send("unable to save to database");
      });
})

Router.delete("/:id", (req, res)=>{
    const id = req.params.id  // any parameters from link
    const user = req.body
    var UserInstance = new UserModel(req.body)
    UserModel.deleteOne(req.body).then(item=>{
        res.status(200).send("item deleted !..")
    }).catch(err => {
        res.status(400).send("can't deleted it...")
    })
})

Router.put("/:id",(req, res)=>{
    const id = req.params.id
    const post = req.body
    UserModel.updateOne({_id:id},post,(err,data)=>{
        if(err) return consol.log("Error Updateing Data")
        else res.send('data updated !..')
    })
},
(req,res,next)=>{
next()// middleware directly after a route called and so on
},(req,res,next)=>{
next()
}
)
module.exports = Router