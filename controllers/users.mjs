import {createUser, getUser} from '../models/users.mjs';
import { devControllers } from '../app.mjs';

const create = async (req, res) => {
    try {
        const {username, password} = req.body;
        const newUser = await createUser(username, password);
        res.status(201).json(newUser);
    } catch (err) {
        devControllers(err);
        res.status(500).json({error: err});
    }
}

const login = async (req, res) => {
    try {
        const {username, password} = req.body;
        const user = await getUser(username);
        if (!user) {
            return res.status(401).json({error: "Invalid credentials"});
        }
        bcrypt.compare(password, user.password, function(err, result) {
            if (err) {
                devControllers(err);
                return res.status(500).json({error: err});
            }
            if (result) {
                return res.status(200).json({username});
            } else {
                return res.status(401).json({error: "Invalid credentials"});
            }
        });
    } catch (err) {
        devControllers(err);
        res.status(500).json({error: err});
    }
}

export {create, login};
