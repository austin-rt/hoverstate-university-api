const router = require('express').Router();
const controller = require('../controllers/StudentController');

router.get('/', controller.GetAllStudents);
router.post('/register', controller.CreateStudent);
router.delete('/:id', controller.DeleteStudent);

module.exports = router;
