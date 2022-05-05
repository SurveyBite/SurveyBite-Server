const mongoose = require('mongoose')

const responseSchema = new mongoose.Schema(
  {
    content: {
      type: String,
      required: true
    },
    question: {
      type: String,
      required: true
    },
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
      ref: 'User',
      required: true
    }
  },
  {
    timestamps: true
  }
)
// we are still module exporting but not making a new Schema model because this is a SUBDOC
module.exports = responseSchema
