const router = require('express').Router();
const UserRouter = require('./UserRouter');
const StudentRouter = require('./StudentRouter');

router.use('/users', UserRouter);
router.use('/students', StudentRouter);

module.exports = router;
