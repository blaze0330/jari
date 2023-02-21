const mongoose = require('mongoose');
const { Schema } = mongoose;

const TasksSchema = new Schema({
    user:{
      type:mongoose.Schema.Types.ObjectId,
      ref : 'user'
    },
    title: {
      type: String,
      required: true,
    },
    totalCount: {
      type: Number,
      required: true,
    },
    completedCount: {
      type: Number,
      required: true,
    },
    animationType: {
      type: Number,
      required : true,
    },
  });
  
  module.exports = mongoose.model('tasks',TasksSchema);