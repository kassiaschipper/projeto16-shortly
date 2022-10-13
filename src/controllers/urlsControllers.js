import connection from "../db/db.js";
import { nanoid } from "nanoid";


async function shortenUrls(req, res){
const { url } = req.body;

//const { session, user } = res.locals //token e userId

try {
    const shortUrl = nanoid(8);
    
    const insertLink = await connection.query(`INSERT INTO links (url, "createAt", "shortUrl", "visitCount") VALUES ($1, CURRENT_DATE, $2,$3);`,[url, shortUrl, null]);    

    res.status(201).send({shortUrl:shortUrl});
    
} catch (error) {
   console.log(error);
   res.sendStatus(422); 
}
}

async function listUrlById(req, res){
    const { id } = req.params; 

    try {
        const listUrls = (await connection.query(`SELECT id,"shortUrl", url FROM links WHERE id=$1;`,[id])).rows;
        return res.send(listUrls)
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }

}

    
export { shortenUrls, listUrlById }


