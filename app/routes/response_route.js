const express = require('express')
// const { resetWatchers } = require('nodemon/lib/monitor/watch')
const passport = require('passport')

const router = express.Router()

const requireToken = passport.authenticate('bearer', { session: false })

// const handle404 = require('./../lib/custom_errors')

const Survey = require('./../models/survey')

router.get('/responses', requireToken, (req, res, next) => {
  Survey.find()
  // .populate('owner')
    .then((surveys) => {
      // `surveys` will be an array of Mongoose documents
      // we want to convert each one to a POJO, so we use `.map` to
      // apply `.toObject` to each one
      return surveys.map((survey) => survey.toObject())
    })
  // respond with status 200 and JSON of the surveys
    .then((surveys) => res.status(200).json({ surveys: surveys }))
  // if an error occurs, pass it to the handler
    .catch(next)
})

router.post('/responses', requireToken, (req, res, next) => {
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

router.get('/responses/:responseID', requireToken, (req, res, next) => {
  // req.params.id will be set based on the `:id` in the route
  Survey.findById(req.params.id)
  // .then(handle404)
  // if `findById` is succesful, respond with 200 and "survey" JSON
    .then((survey) => res.status(200).json({ survey: survey.toObject() }))
  // if an error occurs, pass it to the handler
    .catch(next)
})

router.patch('/responses/:responseID', requireToken, (req, res, next) => {
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

router.delete('/responses/:responseID', requireToken, (req, res, next) => {
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
