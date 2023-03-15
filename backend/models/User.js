const mongoose = require("mongoose");
const { Schema } = mongoose;

const UserSchema = new Schema({
 
  name: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  image:{
    type :String,
    required : true,
    unique : true
  },
  completedTasks:{
    type: Number,
    default : 0,
  }
});

const User = mongoose.model('user',UserSchema);
// User.createIndexes();
module.exports = User;

