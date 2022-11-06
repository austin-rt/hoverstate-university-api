'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.renameColumn('students', 'firstName', 'first_name');
    await queryInterface.renameColumn('students', 'lastName', 'last_name');
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.renameColumn('students', 'first_name', 'firstName');
    await queryInterface.renameColumn('students', 'last_name', 'lastName');
  },
};
