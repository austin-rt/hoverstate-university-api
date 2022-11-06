const { StudentCourse } = require('../../models');

const AssignStudentToCourse = async (req, res) => {
  try {
    const { studentId, courseId, grade } = req.body;
    const studentCourse = await StudentCourse.create({
      student_id: parseInt(studentId),
      course_id: parseInt(courseId),
      grade,
    });
    res.send(studentCourse);
  } catch (err) {
    throw err;
  }
};

const GetAllCoursesByStudentId = async (req, res) => {
  try {
    const studentId = parseInt(req.params.id);
    const courses = await StudentCourse.findAll({
      where: { student_id: studentId },
    });
    res.send(courses);
  } catch (err) {
    throw err;
  }
};

const EditStudentCourseGrade = async (req, res) => {
  try {
    const { studentId, courseId } = req.body;
    const updatedStudentCourse = await StudentCourse.update(req.body, {
      where: { student_id: studentId, course_id: courseId },
      returning: true,
    });
    res.send(updatedStudentCourse);
  } catch (err) {
    throw err;
  }
};

module.exports = {
  AssignStudentToCourse,
  GetAllCoursesByStudentId,
  EditStudentCourseGrade,
};
