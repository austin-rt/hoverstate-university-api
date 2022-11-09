const express = require('express');
const logger = require('morgan');
const cors = require('cors');
const router = require('./v1/routes');
const PORT = process.env.PORT || 3001;

const app = express();

app.use(cors());
app.use(express.json());

app.use(express.urlencoded({ extended: true }));
app.use(logger('dev'));

app.use('/api/v1', router);

app.get('/', (req, res) => res.json({ msg: 'Server working' }));

app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
