const { User } = require('../../models');

const GetAllUsers = async (req, res) => {
  try {
    const users = await User.findAll();
    res.send(users);
  } catch (err) {
    throw err;
  }
};

const CreateUser = async (req, res) => {
  try {
    const { username, password } = req.body;
    const user = await User.create({
      username,
      password,
    });
    res.send(user);
  } catch (err) {
    throw err;
  }
};

module.exports = {
  GetAllUsers,
  CreateUser,
};
