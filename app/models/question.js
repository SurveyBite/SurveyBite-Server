// title string required
// content string required
// timestamps

const mongoose = require('mongoose')
const responseSchema = require('./response')

const questionSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true
    },
    content: {
      type: String,
      required: true
    },
    responses: [responseSchema],
    survey: {
      // References use the type ObjectId
      type: mongoose.Schema.Types.ObjectId,
      // the name of the model to which they refer
      ref: 'Survey'
    },
    owner: {
      // References use the type ObjectId
      type: mongoose.Schema.Types.ObjectId,
      // the name of the model to which they refer
      ref: 'User'
    }
  },
  {
    timestamps: true
  }
)

// we are still module exporting but not making a new Schema model because this is a SUBDOC
module.exports = questionSchema
