const router = require('express').Router();
const controller = require('../controllers/StudentController');

router.get('/', controller.GetAllStudents);
router.post('/register', controller.CreateStudent);
router.put('/:id', controller.UpdateStudentById);
router.delete('/:id', controller.DeleteStudentById);

module.exports = router;
