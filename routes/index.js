var express = require('express'),
    router = express.Router();


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Hello stranger on Node port ' + req.app.get('port') });
});

module.exports = router;
