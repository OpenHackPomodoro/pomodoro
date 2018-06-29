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
router.post('/pomodoro/complete', function(req, res, next) {
  query(`INSERT INTO pomodoro(user_id, timeout, date, gid, isPrivate) VALUES(?, ?, ?, ?, ?)`,
    [req.query.uid, req.query.duration, new Date(), req.query.gid, false])
    .then(r => res.json({ "result": true }))
    .catch(e => {
      console.log(e);
      res.json({ "result": false, "error": e });
    });
});

router.post('/group', (req, res, next) => {
  query(`INSERT INTO _group(isPrivate, group_name) VALUES(?, ?)`, 
    [req.query.isPrivate === 'false' ? false : true, req.query.group_name])
    .then(r => query(`INSERT INTO group_member(gid, user_id) VALUES(?, ?)`, [r.insertId, req.query.uid]))
    .then(r => res.json({ "result": true }))
    .catch(e => {
      console.log(e);
      res.json({ "result": false, "error": e });
    });
});

router.get('/group', (req, res, next) => {
  query(`SELECT _g.group_name, _g.isPrivate FROM _group _g , group_member m
          WHERE _g.gid = m.gid AND m.user_id = ?`, [req.query.uid])
    .then(r => res.json(r))
    .catch(e => {
      console.log(e);
      res.json({ "result": false, "error": e });
    });
})

router.post('/group/member', (req, res, next) => {
  query(`INSERT INTO group_member(gid, user_id) VALUES(?, ?)`, [req.query.gid, req.query.uid])
    .then(r => res.json({ "result": true }))
    .catch(e => {
      console.log(e);
      res.json({ "result": false, "error": e });
    });
})

router.get('/pomodoro/group', (req, res, next) => {
  query(`SELECT user_id, SUM(timeout) total_duration, COUNT(user_id) count FROM pomodoro 
          WHERE gid = ? GROUP BY user_id`, [req.query.gid])
    .then(r => res.json(r))
    .catch(e => {
      console.log(e);
      res.json({ "result": false, "error": e });
    });
})

module.exports = router;

