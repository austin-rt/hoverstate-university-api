'use strict';
/** @type {import('sequelize-cli').Migration} */
const falso = require('@ngneat/falso');
const capitalize = (str) => {
	return str
		.split(' ')
		.map((word) => word[0].toUpperCase() + word.slice(1))
		.join(' ');
};
const generateCourseCode = (course) => {
	return course
		.split(' ')
		.map((word) => word[0])
		.join('')
		.toUpperCase();
};
const introCourses = [...Array(50)].map(() => {
	const name = falso.randSkill();
	const courseCode = generateCourseCode(name);
	return {
		name: `Intro to ${capitalize(name)}`,
		course_code: `IT${courseCode} ${falso.randNumber({
			min: 1000,
			max: 2999
		})}`,
		createdAt: new Date(),
		updatedAt: new Date()
	};
});
const advancedCourses = [...Array(50)].map(() => {
	const name = falso.randSkill();
	const courseCode = generateCourseCode(name);
	return {
		name: `Advanced ${capitalize(name)}`,
		course_code: `A${courseCode} ${falso.randNumber({
			min: 3000,
			max: 4999
		})}`,
		createdAt: new Date(),
		updatedAt: new Date()
	};
});
const courses = [...introCourses, ...advancedCourses];

module.exports = {
	async up(queryInterface, Sequelize) {
		await queryInterface.bulkInsert('courses', courses, {});
	},

	async down(queryInterface, Sequelize) {
		await queryInterface.bulkDelete('courses', null, {});
	}
};

// function that capitalizes the first letter of every word of a string
