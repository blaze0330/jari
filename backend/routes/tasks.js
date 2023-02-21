const express = require("express");
const router = express.Router();
const fetchuser = require("../middleware/fetchuser");
const { body, validationResult } = require("express-validator");
const Tasks = require("../models/Tasks");


// Get all the tasks , login required
router.get("/fetchalltasks", fetchuser, async (req, res) => {
  const tasks = await Tasks.find({ user: req.user.id });
  res.json(tasks);
});

// adding tasks login required
router.post('/addtask', fetchuser, [
  body('title', 'Enter a valid title').isLength({ min: 3 }),
  ], async (req, res) => {
    try {
      const { title, totalCount ,  completedCount, animationType } = req.body;

      // If there are errors, return Bad request and the errors
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
      }
      const task = new Tasks({
        title, totalCount ,  completedCount, animationType, user: req.user.id
      })
      const savedTask = await task.save()

      res.json(savedTask)

    } catch (error) {
      console.error(error.message);
      res.status(500).send("Internal Server Error");
    }
  })



module.exports = router;
