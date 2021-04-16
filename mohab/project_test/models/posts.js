const mongoose = require('mongoose')
const postScema = new mongoose.Schema({
    title  : String,
    body   : String,
    auther: String
})

const PostModel = mongoose.model("Posts",postScema)

module.exports = PostModel