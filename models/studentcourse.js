'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class StudentCourse extends Model {
    static associate(models) {}
  }
  StudentCourse.init(
    {
      student_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'students',
          key: 'id',
        },
      },
      course_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'courses',
          key: 'id',
        },
      },
      grade: {
        type: DataTypes.INTEGER,
        allowNull: true,
      },
    },
    {
      sequelize,
      modelName: 'StudentCourse',
      tableName: 'students_courses',
    }
  );
  return StudentCourse;
};
