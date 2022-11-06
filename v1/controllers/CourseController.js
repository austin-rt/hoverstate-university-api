const { Course, Student } = require('../../models');

const GetAllCourses = async (req, res) => {
  try {
    const courses = await Course.findAll({
      include: [
        {
          model: Student,
          as: 'students',
          through: { attributes: ['grade'] },
        },
      ],
    });
    res.send(courses);
  } catch (err) {
    throw err;
  }
};

const GetCourseById = async (req, res) => {
  try {
    const courseId = parseInt(req.params.id);
    const course = await Course.findByPk(courseId, {
      include: [
        {
          model: Student,
          as: 'students',
          through: { attributes: ['grade'] },
        },
      ],
    });
    res.send(course);
  } catch (err) {
    throw err;
  }
};

const CreateCourse = async (req, res) => {
  try {
    const { name } = req.body;
    const course = await Course.create({
      name,
    });
    res.send(course);
  } catch (err) {
    throw err;
  }
};

const UpdateCourseById = async (req, res) => {
  try {
    const courseId = parseInt(req.params.id);
    const updatedCourse = await Course.update(req.body, {
      where: { id: courseId },
      returning: true,
    });
    res.send(updatedCourse);
  } catch (err) {
    throw err;
  }
};

const DeleteCourseById = async (req, res) => {
  try {
    const { id } = req.params;
    await Course.destroy({
      where: { id },
    });
    res.send({ msg: `Course with id ${id} was deleted` });
  } catch (err) {
    throw err;
  }
};

module.exports = {
  GetAllCourses,
  GetCourseById,
  CreateCourse,
  UpdateCourseById,
  DeleteCourseById,
};
