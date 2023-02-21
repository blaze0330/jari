const express = require("express");
const router = express.Router();
const fetchuser = require("../middleware/fetchuser");
const { body, validationResult } = require("express-validator");
const Notes = require("../models/Notes");


// Get all the notes , login required
router.get("/fetchallnotes", fetchuser, async (req, res) => {
  const notes = await Notes.find({ user: req.user.id });
  res.json(notes);
});

// adding notes login required
router.post('/addnotes', fetchuser, [
  body('title', 'Enter a valid title').isLength({ min: 3 }),
  body('description', 'Description must be atleast 5 characters').isLength({ min: 5 }),], async (req, res) => {
      try {
          const { title, description, tag } = req.body;

          // If there are errors, return Bad request and the errors
          const errors = validationResult(req);
          if (!errors.isEmpty()) {
              return res.status(400).json({ errors: errors.array() });
          }
          const note = new Notes({
              title, description, tag, user: req.user.id
          })
          const savedNote = await note.save()

          res.json(savedNote)

      } catch (error) {
          console.error(error.message);
          res.status(500).send("Internal Server Error");
      }
  })

// Updating notes 
router.put("/updatenote/:id", fetchuser, async (req, res) => {
  const { title, description, tag } = req.body;
  // create new object
  const newNote = {};
  if (title) {
    newNote.title = title;
  }
  if (description) {
    newNote.description = description;
  }
  if (tag) {
    newNote.tag = tag;
  }

  // find the note to be updated and update it
  let note = await Notes.findById(req.params.id);
  if (!note) {
    return req.status(404).send("not found");
  }

  if (note.user.toString() !== req.user.id) {
    return res.status(401).send("Not Allowed");
  }

  note = await Notes.findByIdAndUpdate(
    req.params.id,
    { $set: newNote },
    { new: true }
  );
  res.json({ note });
});

// Deleting note
router.delete("/deletenote/:id", fetchuser, async (req, res) => {

  

  // find the note to be deleted
  let note = await Notes.findById(req.params.id);
  if (!note) {
    console.log("no")
    return req.status(404).send("not found");
  }

  // allow deletion only if user owns this note
  if (note.user.toString() !== req.user.id) {
    console.log("yes")
    return res.status(401).send("Not Allowed");
  }

  // delete note
  note = await Notes.findByIdAndDelete(
    req.params.id,
    
  );
  res.json({ 'success' :'note has been deleted' });
});

module.exports = router;
