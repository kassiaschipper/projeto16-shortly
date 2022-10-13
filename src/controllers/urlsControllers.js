import connection from "../db/db.js";
import { nanoid } from "nanoid";


async function shortenUrls(req, res){
const { url } = req.body;

const { session, user } = res.locals //token e userId

//console.log(session, user) 

try {
    const shortUrl = nanoid(8);
    
    const insertLink = await connection.query(`INSERT INTO links (url, "createAt", "shortUrl", "visitCount") VALUES ($1, CURRENT_DATE, $2,$3);`,[url, shortUrl, null]);    

    res.status(201).send({shortUrl:shortUrl});
    
} catch (error) {
   console.log(error);
   res.sendStatus(422); 
}




}

    
export { shortenUrls }


