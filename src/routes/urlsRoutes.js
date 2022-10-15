import express from "express";
import { authToken} from "../middlewares/authMeddlewares.js"
import { urlValidation } from "../middlewares/urlsMiddlewares.js"
import { shortenUrls, listUrlById, openShortUrl, deleteUrl } from "../controllers/urlsControllers.js"

const router = express.Router();
router.post("/urls/shorten", authToken, urlValidation, shortenUrls);
router.get("/urls/:id", listUrlById );
router.get("/urls/open/:shortUrl",openShortUrl);
router.delete("/urls/:id", authToken, deleteUrl);

export default router;