const express = require('express');
const logger = require('morgan');
const cors = require('cors');
const router = require('./routes');
const PORT = process.env.PORT || 3001;

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(logger('dev'));

app.use('/api', router);

app.get('/', (req, res) => res.json({ message: 'Server working' }));

app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
