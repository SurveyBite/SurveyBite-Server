const express = require('express')
// const { resetWatchers } = require('nodemon/lib/monitor/watch')

const router = express.Router()

// const handle404 = require('./../lib/custom_errors')

const Survey = require('./../models/survey')

router.post('/responses', (req, res, next) => {
  const responseData = req.body.response

  const surveyId = responseData.surveyId

  Survey.findById(surveyId)
  // .then(handle404)
    .then((survey) => {
      survey.responses.push(responseData)

      return survey.save()
    })
    .then((survey) => res.status(201).json({ survey: survey }))
    .catch(next)
})

router.patch('/responses/:responseID', (req, res, next) => {
  const responseID = req.params.responseID
  const responseData = req.body.response
  const surveyID = responseData.surveyId

  Survey.findById(surveyID)
  // .then(handle404)
    .then((survey) => {
      const response = survey.responses.id(responseID)

      response.set(responseData)

      return survey.save()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

router.delete('/responses/:responseID', (req, res, next) => {
  const responseID = req.params.responseID
  const surveyID = req.body.response.surveyId

  Survey.findById(surveyID)
  // .then(handle404)
    .then((survey) => {
      const response = survey.responses.id(responseID)

      response.remove()

      return survey.save()
    })
    .then(() => res.sendStatus(204))
    .catch(next)
})

module.exports = router
