import express from "express";
import { authToken} from "../middlewares/authMeddlewares.js"
import { listUserData } from "../controllers/userControllers.js"

const router = express.Router();
router.get("/users/me", authToken, listUserData)

export default router;