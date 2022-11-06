const router = require('express').Router();
const UserRouter = require('./UserRouter');
const StudentRouter = require('./StudentRouter');
const CourseRouter = require('./CourseRouter');
const StudentCourseRouter = require('./StudentCourseRouter');

router.use('/users', UserRouter);
router.use('/students', StudentRouter);
router.use('/courses', CourseRouter);
router.use('/student-courses', StudentCourseRouter);

module.exports = router;
