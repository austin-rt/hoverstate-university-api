# Hoverstate University API

## Date: 11/11/2022

### By: Austin Taylor

[Website](https://wwww.austinrt.io) | [GitHub](https://github.com/austin-rt) | [LinkedIn](https://www.linkedin.com/in/austinrt/)

![Hoverstate University Banner](./images/png/hoverstate_university_readme_banner.png)

### **_Links_**

- [Hoverstate University Demo](https://hoverstate-university.netlify.app/)

- [Front-End Repo](https://github.com/austin-rt/hoverstate-universit)

- [Back-End Repo](https://github.com/austin-rt/hoverstate-university-api)

---

### **_Description_**

Hoverstate University is a simple full-stack test project built using a PostgreSQL database with Sequelize as an ORM, React.js as the main frontend library. The current implementation uses Redux Toolkit along with Redux Persist to manage User State. The API is deployed using Railway and the front-end is deployed using Netlify.

### **_API V1_**

Available routes are as follows:

- `/auth`
  - `/login`
  - `/register`
- `/courses`
  - `/` - get all courses
  - `/:id` - get course by id
  - `/:id` - update course by id
  - `/:id` - delete course by id
  - `/create` - post new course
- `/students`
  - `/` get all students
  - `/:id` - get student by id
  - `/:id` - update student by id
  - `/:id` - delete student by id
- `/student-courses` (join table)
  - `/:id` - get all courses by student id
  - `/grade` - edit student grade
  - `/assign` - assign student to course
- `/users`
  - `/` - get all users (protected)

### **_Technologies Used_**

- PosgreSQL
- Sequelize
- Express
- React.js
- Redux Toolkit
- TailwindCSS
- Node.js
- Railway / Netlify

#### **_Entity Relationship Diagram:_**

![Entity Relationship Diagram](./images/drawio/hoverstate_university_erd.drawio.png 'Entity Relationship Diagram')

#### **_Component Hierarchy Diagram:_**

![Component Hierarchy Diagram](./images/png/hoverstate_university_CHD.png 'Component Hierarchy Diagram')

### **_License_**

MIT License

###### Copyright &copy; 2022 Austin Taylor
