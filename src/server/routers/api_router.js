const router = require('express').Router();
const fs = require('fs');

router.route('/upload-stim').post((req, res, next) => {
  console.log('test route working');
});

module.exports = router;
