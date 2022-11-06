'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.renameColumn('courses', 'abbreviation', 'course_code');
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.renameColumn('courses', 'course_code', 'abbreviation');
  },
};
