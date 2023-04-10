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
router.post(
  "/addtask",
  fetchuser,
  [body("title", "Enter a valid title").isLength({ min: 3 })],
  async (req, res) => {
    console.log("hello buddy")
    try {
      const { title, totalCount,  animationType } = req.body;

      // If there are errors, return Bad request and the errors
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res
          .status(400)
          .json({ success: false, error: errors.array()[0]["msg"] });
      }
      const task = new Tasks({
        title,
        totalCount,
        animationType,
        user: req.user.id,
      });
      const savedTask = await task.save();

      res.json(savedTask);
    } catch (error) {
      console.error(error.message);
      res.status(500).send("Internal Server Error");
    }
  }
);
//update task
router.put("/updatetask/:id", fetchuser, async (req, res) => {
  // create new object
  

  // find the note to be updated and update it
  let task = await Tasks.findById(req.params.id);
  
  task['completedCount']+=1;
  const newTask = task;

  if (!task) {
    return req.status(404).send("not found");
  }

  if (task.user.toString() !== req.user.id) {
    return res.status(401).send("Not Allowed");
  }

  task = await Tasks.findByIdAndUpdate(
    req.params.id,
    { $set: newTask },
    { new: true }
  );
  res.json({ task });
});

module.exports = router;
