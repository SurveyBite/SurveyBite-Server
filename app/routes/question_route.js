const express = require('express')
// const { resetWatchers } = require('nodemon/lib/monitor/watch')

const router = express.Router()

// const handle404 = require('./../lib/custom_errors')

const Survey = require('./../models/survey')

router.post('/questions', (req, res, next) => {
  const questionData = req.body.question

  const surveyId = questionData.surveyId

  Survey.findById(surveyId)
    // .then(handle404)
    .then((survey) => {
      survey.questions.push(questionData)

      return survey.save()
    })
    .then((survey) => res.status(201).json({ survey: survey }))
    .catch(next)
})

router.patch('/questions/:questionID', (req, res, next) => {
  const questionID = req.params.questionID
  const questionData = req.body.question
  const surveyID = questionData.surveyId

  Survey.findById(surveyID)
    // .then(handle404)
    .then((survey) => {
      const question = survey.questions.id(questionID)

      question.set(questionData)

      return survey.save()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.delete('/questions/:questionID', (req, res, next) => {
  const questionID = req.params.questionID
  const surveyID = req.body.question.surveyId

  Survey.findById(surveyID)
    // .then(handle404)
    .then((survey) => {
      const question = survey.questions.id(questionID)

      question.remove()

      return survey.save()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

module.exports = router
