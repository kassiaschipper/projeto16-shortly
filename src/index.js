import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import authRoutes from "./routes/authRoutes.js"
import urlsRoutes from "./routes/urlsRoutes.js"

dotenv.config();

const server = express();
server.use(cors());
server.use(express.json());


server.use(authRoutes);
server.use(urlsRoutes);

server.get("/status", (req, res) => {
    return res.send("Ok");
});

server.listen(process.env.PORT, () => {
  console.log(`Listening on port ${process.env.PORT}`);
});