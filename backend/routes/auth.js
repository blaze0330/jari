const express = require("express");
const User = require("../models/User");
const { body, validationResult } = require("express-validator");
const router = express.Router();
const bcrypt = require("bcryptjs");
const fetchuser = require("../middleware/fetchuser");
var jwt = require("jsonwebtoken");
const Notes = require("../models/Tasks");

const JWT_SECRET = "Ayushisabadb$oy";
// registering user
router.post(
  "/createuser",
  [
    body("email", "email not valid").isEmail(),
    body("password", "password must be upto 5 digits").isLength({ min: 5 }),
    body("name", "name must be more than 3 char long").isLength({ min: 3 }),
  ],

  //   checking for errors
  async (req, res) => {
    let success = false;
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
     
      return res.status(400).json({ success : false ,  error: errors.array()[0]['msg'] });
    }
    // check weather user with this email already exist
    try {
      let user = await User.findOne({ email: req.body.email });
      if (user) {
        return res.status(400).json({ error: "sorry email allready exist" });
      }
      //   create user
      const salt = await bcrypt.genSaltSync(10);
      const secPass = await bcrypt.hash(req.body.password, salt);
      user = await User.create({
        name: req.body.name,
        email: req.body.email,
        password: secPass,
        image:req.body.image,
      });

      const data = {
        user: {
          id: user.id,
        },
      };

      const authtoken = jwt.sign(data, JWT_SECRET);
      success = true

      res.json({ success, authtoken });
    } catch (error) {
      console.error(error.message);
      res.status(500).send("Internal Server Error");
    }
  }
);

// Authenticate a user
router.post(
  "/login",
  [
    body("email", "email not valid").isEmail(),
    body("password", "password must be upto 5 digits").isLength({ min: 5 }),
  ],

  //   checking for errors
  async (req, res) => {
    let success = false;
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
     
      return res.status(400).json({ success : false ,  error: errors.array()[0]['msg'] });
    }
    // check weather user with this email already exist
    const { email, password } = req.body;

    try {
      let user = await User.findOne({ email });
      if (!user) {
        return res
          .status(400)
          .json({ success, error: "please try to login with correct credentials" });
      }

      const passwordCompare = await bcrypt.compare(password, user.password);
      if (!passwordCompare) {
        return res
          .status(400)
          .json({ success, error: "please try to login with correct credentials" });
      }
      //   create user

      const data = {
        user: {
          id: user.id,
        },
      };

      const authtoken = jwt.sign(data, JWT_SECRET);
      success = true

      res.json({ success, authtoken });
    } catch (error) {
      console.error(error.message);
      res.status(500).send("Internal Server Error");
    }
  }
);

// ROUTE 3 : get logged in user details using : POST '/api/auth/getuser' . Login required
router.get("/getuser", fetchuser, async (req, res) => {
  try {
    userId = req.user.id;
    const user = await User.findById(userId).select("-password");
    res.send(user);
  } catch (error) {
    console.error(error.message);
    res.status(500).send("Internal Server Error");
  }
});




module.exports = router;
