// const { User } = require('../models');

const GetAllUsers = async (req, res) => {
  res.send({ message: 'get users all users route hit' });
  // try {
  //   const users = await User.findAll();
  //   res.send(users);
  // } catch (error) {
  //   throw error;
  // }
};

module.exports = {
  GetAllUsers,
};
