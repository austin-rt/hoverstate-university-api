const { Student } = require('../models');

const GetAllStudents = async (req, res) => {
  try {
    const students = await Student.findAll();
    res.send(students);
  } catch (err) {
    throw err;
  }
};

const CreateStudent = async (req, res) => {
  try {
    const { firstName, lastName, email } = req.body;
    const user = await Student.create({
      firstName,
      lastName,
      email,
    });
    res.send(user);
  } catch (err) {
    throw err;
  }
};

const DeleteStudentById = async (req, res) => {
  try {
    const { id } = req.params;
    await Student.destroy({
      where: {
        id,
      },
    });
    res.send({ msg: `Student with id ${id} was deleted` });
  } catch (err) {
    throw err;
  }
};

module.exports = {
  GetAllStudents,
  CreateStudent,
  DeleteStudentById,
};
