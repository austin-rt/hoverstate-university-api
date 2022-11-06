const router = require('express').Router();
const UserRouter = require('./UserRouter');
const StudentRouter = require('./StudentRouter');
const CourseRouter = require('./CourseRouter');
const StudentCourseRouter = require('./StudentCourseRouter');
const AuthRouter = require('./AuthRouter');

router.use('/users', UserRouter);
router.use('/students', StudentRouter);
router.use('/courses', CourseRouter);
router.use('/student-courses', StudentCourseRouter);
router.use('/auth', AuthRouter);

router.get('/', (req, res) => res.json({ msg: 'API root working' }));

module.exports = router;
