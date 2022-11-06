require('dotenv').config()
module.exports = {
  "development": {
    "database": "hoverstate_students_development",
    "dialect": "postgres"
  },
  "test": {
    "database": "hoverstate_students_test",
    "dialect": "postgres"
  },
  "production": {
    "use_env_variable": "DATABASE_URL",
    "dialect": "postgres",
    "dialectOptions": {
      "ssl": {
        "rejectUnauthorized": false,
        "require": true
      }
    }
  }
}