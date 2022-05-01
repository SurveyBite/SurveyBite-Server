process.env.TESTENV = true

let Survey = require('../app/models/survey.js')
let User = require('../app/models/user')

const crypto = require('crypto')

let chai = require('chai')
let chaiHttp = require('chai-http')
let server = require('../server')
chai.should()

chai.use(chaiHttp)

const token = crypto.randomBytes(16).toString('hex')
let userId
let surveyId

describe('surveys', () => {
  const surveyParams = {
    title: "13 JavaScript tricks SEI instructors don't want you to know",
    text: "You won'believe number 8!"
  }

  before((done) => {
    Survey.deleteMany({})
      .then(() =>
        User.create({
          email: 'caleb',
          hashedPassword: '12345',
          token
        })
      )
      .then((user) => {
        userId = user._id
        return user
      })
      .then(() => Survey.create(Object.assign(surveyParams, { owner: userId })))
      .then((record) => {
        surveyId = record._id
        done()
      })
      .catch(console.error)
  })

  describe('GET /surveys', () => {
    it('should get all the surveys', (done) => {
      chai
        .request(server)
        .get('/surveys')
        .set('Authorization', `Token token=${token}`)
        .end((e, res) => {
          res.should.have.status(200)
          res.body.surveys.should.be.a('array')
          res.body.surveys.length.should.be.eql(1)
          done()
        })
    })
  })

  describe('GET /surveys/:id', () => {
    it('should get one survey', (done) => {
      chai
        .request(server)
        .get('/surveys/' + surveyId)
        .set('Authorization', `Token token=${token}`)
        .end((e, res) => {
          res.should.have.status(200)
          res.body.survey.should.be.a('object')
          res.body.survey.title.should.eql(surveyParams.title)
          done()
        })
    })
  })

  describe('DELETE /surveys/:id', () => {
    let surveyId

    before((done) => {
      Survey.create(Object.assign(surveyParams, { owner: userId }))
        .then((record) => {
          surveyId = record._id
          done()
        })
        .catch(console.error)
    })

    it('must be owned by the user', (done) => {
      chai
        .request(server)
        .delete('/surveys/' + surveyId)
        .set('Authorization', `Bearer notarealtoken`)
        .end((e, res) => {
          res.should.have.status(401)
          done()
        })
    })

    it('should be succesful if you own the resource', (done) => {
      chai
        .request(server)
        .delete('/surveys/' + surveyId)
        .set('Authorization', `Bearer ${token}`)
        .end((e, res) => {
          res.should.have.status(204)
          done()
        })
    })

    it("should return 404 if the resource doesn't exist", (done) => {
      chai
        .request(server)
        .delete('/surveys/' + surveyId)
        .set('Authorization', `Bearer ${token}`)
        .end((e, res) => {
          res.should.have.status(404)
          done()
        })
    })
  })

  describe('POST /surveys', () => {
    it('should not POST an survey without a title', (done) => {
      let noTitle = {
        text: 'Untitled',
        owner: 'fakedID'
      }
      chai
        .request(server)
        .post('/surveys')
        .set('Authorization', `Bearer ${token}`)
        .send({ survey: noTitle })
        .end((e, res) => {
          res.should.have.status(422)
          res.should.be.a('object')
          done()
        })
    })

    it('should not POST an survey without text', (done) => {
      let noText = {
        title: 'Not a very good survey, is it?',
        owner: 'fakeID'
      }
      chai
        .request(server)
        .post('/surveys')
        .set('Authorization', `Bearer ${token}`)
        .send({ survey: noText })
        .end((e, res) => {
          res.should.have.status(422)
          res.should.be.a('object')
          done()
        })
    })

    it('should not allow a POST from an unauthenticated user', (done) => {
      chai
        .request(server)
        .post('/surveys')
        .send({ survey: surveyParams })
        .end((e, res) => {
          res.should.have.status(401)
          done()
        })
    })

    it('should POST an survey with the correct params', (done) => {
      let validSurvey = {
        title: "I ran a shell command. You won't believe what happened next!",
        text: 'it was rm -rf / --no-preserve-root'
      }
      chai
        .request(server)
        .post('/surveys')
        .set('Authorization', `Bearer ${token}`)
        .send({ survey: validSurvey })
        .end((e, res) => {
          res.should.have.status(201)
          res.body.should.be.a('object')
          res.body.should.have.property('survey')
          res.body.survey.should.have.property('title')
          res.body.survey.title.should.eql(validSurvey.title)
          done()
        })
    })
  })

  describe('PATCH /surveys/:id', () => {
    let surveyId

    const fields = {
      title: 'Find out which HTTP status code is your spirit animal',
      text: 'Take this 4 question quiz to find out!'
    }

    before(async function () {
      const record = await Survey.create(
        Object.assign(surveyParams, { owner: userId })
      )
      surveyId = record._id
    })

    it('must be owned by the user', (done) => {
      chai
        .request(server)
        .patch('/surveys/' + surveyId)
        .set('Authorization', `Bearer notarealtoken`)
        .send({ survey: fields })
        .end((e, res) => {
          res.should.have.status(401)
          done()
        })
    })

    it('should update fields when PATCHed', (done) => {
      chai
        .request(server)
        .patch(`/surveys/${surveyId}`)
        .set('Authorization', `Bearer ${token}`)
        .send({ survey: fields })
        .end((e, res) => {
          res.should.have.status(204)
          done()
        })
    })

    it('shows the updated resource when fetched with GET', (done) => {
      chai
        .request(server)
        .get(`/surveys/${surveyId}`)
        .set('Authorization', `Bearer ${token}`)
        .end((e, res) => {
          res.should.have.status(200)
          res.body.should.be.a('object')
          res.body.survey.title.should.eql(fields.title)
          res.body.survey.text.should.eql(fields.text)
          done()
        })
    })

    it("doesn't overwrite fields with empty strings", (done) => {
      chai
        .request(server)
        .patch(`/surveys/${surveyId}`)
        .set('Authorization', `Bearer ${token}`)
        .send({ survey: { text: '' } })
        .then(() => {
          chai
            .request(server)
            .get(`/surveys/${surveyId}`)
            .set('Authorization', `Bearer ${token}`)
            .end((e, res) => {
              res.should.have.status(200)
              res.body.should.be.a('object')
              // console.log(res.body.survey.text)
              res.body.survey.title.should.eql(fields.title)
              res.body.survey.text.should.eql(fields.text)
              done()
            })
        })
    })
  })
})
