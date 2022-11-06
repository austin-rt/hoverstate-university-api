'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert(
      'courses',
      [
        {
          name: 'Topics In Computing',
          abbreviation: 'CSCI 1100',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Computer Modeling and Science',
          abbreviation: 'CSCI 1210',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Introduction to Computing and Programming',
          abbreviation: 'CSCI 1301',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Introduction to Theory of Computing',
          abbreviation: 'CSCI 2670',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Software Development',
          abbreviation: 'CSCI 1302',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Foundations for Informatics and Data Analytics',
          abbreviation: 'CSCI 1360',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Data Structures',
          abbreviation: 'CSCI 2720',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Calculus I for Science and Engineering',
          abbreviation: 'MATH 2250',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Systems Programming',
          abbreviation: 'CSCI 1730',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
        {
          name: 'Computer Architecture and Organization',
          abbreviation: 'CSCI 4720',
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      ],
      {}
    );
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('courses', null, {});
  },
};
