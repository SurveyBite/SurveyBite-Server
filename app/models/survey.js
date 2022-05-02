const mongoose = require('mongoose')
const questionSchema = require('./question')

const surveySchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true
    },
    text: {
      type: String
    },
    questions: [questionSchema],
    owner: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
      required: true
    }
  },
  {
    timestamps: true
  }
)

module.exports = mongoose.model('Survey', surveySchema)
