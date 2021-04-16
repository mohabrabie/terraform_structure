const mongoose = require('mongoose')
const userScema = new mongoose.Schema({ // Create Object with ORM with MongoDB
    firstname : { type: String, required: true, lowercase: true },
    lastname :  String,
    DOB :       Date,
email :     { type : String , match: /.*@.*\..*/, unique: true }
})


const UserModel = mongoose.model("User" , userScema) // Create Model with scema we made and a name "User"

// I can add methods static or for instance
userScema.methods.getFullName = function () { // instance value
    return this.firstname + " " + this.lastname
}
// this don't work with arrow function =>
userScema.statics.getUserByName = function (name,cb){ // static function
    this.count({firstname : name},cb)
}

module.exports = UserModel // to use it outside


