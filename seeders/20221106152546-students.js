'use strict';
const falso = require('@ngneat/falso');
const students = [...Array(500)].map(() => ({
  first_name: falso.randFirstName(),
  last_name: falso.randLastName(),
  email: falso.randEmail({ provider: 'hoverstate', suffix: 'edu' }),
  createdAt: new Date(),
  updatedAt: new Date(),
}));

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('students', students, {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('students', null, {});
  },
};
