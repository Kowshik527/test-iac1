const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());

app.post('/http-trigger', (req, res) => {
    const emailBody = req.body;
    // Handle the email body as needed
    console.log('Received email body:', emailBody);
    res.status(200).send('Email body received successfully.');
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
