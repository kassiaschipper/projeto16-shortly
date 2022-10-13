import express from "express";
import { authValidationSignUp, authValidationSignIn } from "../middlewares/authMeddlewares.js";
import { signUp, signIn } from "../controllers/authControllers.js";

const router = express.Router();
router.post("/signup", authValidationSignUp, signUp);
router.post("/signin", authValidationSignIn, signIn);

export default router;