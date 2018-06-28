var express = require('express');
var router = express.Router();
var mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'ehqps2m7',
  database: 'pomodoro',
});

const query = (...args) => {
  return new Promise((resolve, reject) => {
    connection.query(...args, (err, rows) => {
      if(err) reject(err);
      else resolve(rows);
    })
  });
};

/* GET home page. */
router.post('/complete', function(req, res, next) {
  console.log(req.query);
  query(`INSERT INTO pomodoro(user_id, timeout, date, gid, isPrivate) VALUES(?, ?, ?, ?, ?)`,
    [req.query.id, req.query.duration, new Date(), req.query.gid, false])
    .then(r=>console.log(r));

  res.send('dd');
});

router.get('/group', (req, res, next) => {
  query(`show databases`)
    .then(r => console.log(r));
})
module.exports = router;
