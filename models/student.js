'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Student extends Model {
    static associate(models) {
      Student.belongsToMany(models.Course, {
        through: models.StudentCourse,
        as: 'courses',
        foreignKey: 'student_id',
      });
    }
  }
  Student.init(
    {
      firstName: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      lastName: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        validate: {
          isEmail: true,
        },
      },
    },
    {
      sequelize,
      modelName: 'Student',
      tableName: 'students',
    }
  );
  return Student;
};
