const express = require('express')
const PostModel = require('../models/posts')
const mongoose = require('mongoose')
const Router = express.Router() // object to add some routes on it and export it to the app

Router.get("",(req, res)=>{  // get on 
    PostModel.find({}, (err, data)=>{
        if (err) return console.log("error getting the Data")
        else res.send(data)
    })
})

Router.get("/:id",(req, res)=>{
    var id = req.params.id
    PostModel.findOne({_id:id}, (err, data)=>{
        if (err) return console.log("error getting the Data")
        else res.send(data)
    })
})

Router.post("", (req, res)=>{
    const post = req.body
    console.log(post) //Json file on postmen to save on db
    var PostInstance = new PostModel(req.body)
    PostInstance.save().then(item => {
      res.status(200).send("item saved to database");
    }).catch(err => {
        res.status(400).send("unable to save to database");
      });
})

Router.delete("/:id", (req, res)=>{
    const id = req.params.id  // any parameters from link
    var PostInstance = new PostModel(req.body)
    PostModel.deleteOne({_id:id}).then(item=>{
        res.status(200).send("item deleted !..")
    }).catch(err => {
        res.status(400).send("can't deleted it...")
    })
})
Router.put("/:id",(req, res)=>{
    const id = req.params.id
    const post = req.body
    PostModel.updateOne({_id:id},post,(err,data)=>{
        if(err) return consol.log("Error Updateing Data")
        else res.send('data updated !..')
    })
})
module.exports = Router