import express from 'express';
import {create, login} from '../controllers/users.mjs';
import { checkRunning } from '../controllers/checkImRunning.mjs';

const router = express.Router();

router.post('/', create);
router.post('/login', login);

export default router;

