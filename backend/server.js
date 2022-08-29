const express = require('express');
const cors = require('cors');
const { networkInterfaces } = require('os');

const { getMemories } = require('./helpers');

const app = express();
const PORT = 1000;

const getLocalExternalIp = () => {
    const settings= [].concat.apply([], Object.values(networkInterfaces()));
    return settings.filter((details) => details.family === 'IPv4' && !details.internal).pop().address;
}; 

const HOST = process.env.NODE_ENV === 'production' ? getLocalExternalIp() : '127.0.0.1';

app.use(cors({
    origin: [
        `http://${HOST}:5173`,
        'http://localhost:5173',
        'http://localhost:4173',
    ]
}));
app.use(express.static('public'));


app.get('/memories', (req, res) => {
    res.json(getMemories(`http://${HOST}:${PORT}/images`))
});

app.listen(PORT, HOST, () => {
    console.log(`Server running at http://${HOST}:${PORT}/`);
})