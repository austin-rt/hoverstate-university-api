const router = require('express').Router();
const controller = require('../controllers/StudentCourseController');
const middleware = require('../middleware');

router.get(
  '/:id',
  // middleware.stripToken,
  // middleware.verifyToken,
  controller.GetAllCoursesByStudentId
);
router.put(
  '/grade',
  // middleware.stripToken,
  // middleware.verifyToken,
  controller.EditStudentCourseGrade
);
router.post(
  '/assign',
  // middleware.stripToken,
  // middleware.verifyToken,
  controller.AssignStudentToCourse
);

module.exports = router;
