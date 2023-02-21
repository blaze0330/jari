var jwt = require("jsonwebtoken");
const JWT_SECRET = "Ayushisabadb$oy";

const fetchuser = (req,res,next) =>{
    const token = req.header('auth-token');
    if (!token) {
        res.status(401).send({error : 'please validate using a valid token'})
    }
    const string = jwt.verify(token , JWT_SECRET)
    req.user = string.user
    next()
}

module.exports = fetchuser;
