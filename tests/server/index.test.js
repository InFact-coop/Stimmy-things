const should = require('chai').should();
const expect = require('chai').expect;
const supertest = require('supertest');
const app = require('../../src/server/app');

describe('Dummy test', () => {
  it('1+1 should return 2', () => {
    expect(1 + 1).to.equal(2);
  });
});
//
describe('Static files', () => {
  it('GET / returns our app', done => {
    supertest(app)
      .get('/')
      .end((err, res) => {
        if (err) {
          done(err);
        }
        expect(res.statusCode).to.equal(200);
        expect(res.type).to.equal('text/html');
        done();
      });
  });
  it('GET /style.min.css returns css file', done => {
    supertest(app)
      .get('/style.min.css')
      .end((err, res) => {
        if (err) {
          done(err);
        }
        expect(res.statusCode).to.equal(200);
        expect(res.type).to.equal('text/css');
        done();
      });
  });
  it('GET /elm.js returns js file', done => {
    supertest(app)
      .get('/elm.js')
      .end((err, res) => {
        if (err) {
          done(err);
        }
        expect(res.statusCode).to.equal(200);
        expect(res.type).to.equal('application/javascript');
        done();
      });
  });
});
