const mongoose = require('mongoose');
const mongoURI = 'mongodb://localhost:27017/jarify'

const connectToMongo = ()=>{
    mongoose.connect(mongoURI,()=> {
        console.log("conected to mongo successfuly");
    })
}

module.exports = connectToMongo;
