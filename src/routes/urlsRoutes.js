import express from "express";
import { authToken} from "../middlewares/authMeddlewares.js"
import { urlValidation } from "../middlewares/urlsMiddlewares.js"
import { shortenUrls } from "../controllers/urlsControllers.js"

const router = express.Router();
router.post("/urls/shorten", authToken, urlValidation, shortenUrls);

export default router;