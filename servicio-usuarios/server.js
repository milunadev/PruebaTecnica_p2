const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const app = express();


app.use(express.json());
app.use(cors());

// Modelo de usuario
const UserSchema = new mongoose.Schema({
    password: String
});

const User = mongoose.model('User', UserSchema);
const mongoUri = process.env.MONGODB_URI || 'mongodb://localhost:27017/miBaseDatos';


// Registro de usuario
app.post('/register', async (req, res) => {
    try {
        const { username, password } = req.body;
        const hashedPassword = await bcrypt.hash(password, 10);
        const user = new User({ username, password: hashedPassword });
        await user.save();
        res.status(201).send('User created');
    } catch (error) {
        res.status(500).send('Error creating user');
    }
});

// Conexión a MongoDB
mongoose.connect(mongoUri, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('Connected to MongoDB'))
    .catch(err => console.error('Could not connect to MongoDB', err));

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Servicio de usuarios escuchando en el puerto ${port}`);
});
