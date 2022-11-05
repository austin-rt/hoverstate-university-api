const router = require('express').Router();
const controller = require('../controllers/UserController');

router.get('/', controller.GetAllUsers);
router.post('/register', controller.CreateUser);

module.exports = router;
