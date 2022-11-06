const { User } = require('../../models');
const middleware = require('../middleware');

const Register = async (req, res) => {
  try {
    const { username, password } = req.body;
    let passwordDigest = await middleware.hashPassword(password);
    const user = await User.create({ username, password: passwordDigest });
    res.send(user);
  } catch (err) {
    throw err;
  }
};

const Login = async (req, res) => {
  try {
    const user = await User.findOne({
      where: { username: req.body.username },
      raw: true,
    });
    if (user && middleware.comparePassword(user.password, req.body.password)) {
      let payload = {
        id: user.id,
        username: user.username,
      };
      let token = middleware.createToken(payload);
      return res.send({ user: payload, token });
    }
    res.status(401).send({ status: 'Error', msg: 'Unauthorized' });
  } catch (err) {
    throw err;
  }
};

module.exports = {
  Register,
  Login,
};
