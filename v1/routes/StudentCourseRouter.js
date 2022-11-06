const router = require('express').Router();
const controller = require('../controllers/StudentCourseController');

router.get('/:id', controller.GetAllCoursesByStudentId);
router.put('/grade', controller.EditStudentCourseGrade);
router.post('/assign', controller.AssignStudentToCourse);

module.exports = router;
