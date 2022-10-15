import connection from "../db/db.js";


async function listUserData(req, res){
const { user } = res.locals; //userId

try {
   const shortenedUrls = (await connection.query(`SELECT id, "shortUrl", url, "visitCount" FROM links WHERE "userId"=$1;`, [user])).rows;
   const userData = (await connection.query(`SELECT id, name FROM users WHERE id=$1;`, [user])).rows[0];
   
   if(userData === undefined){
    return res.sendStatus(401);
   }  
   const visitCount = shortenedUrls.map(value => value.visitCount).reduce((a,b) => a+ b, 0);
   const userInfos = {id: userData.id, name: userData.name, visitCount, shortenedUrls}
   
   
  return res.status(200).send(userInfos)
} catch (error) {
    console.log(error);
    return res.sendStatus(500);
}

}

export { listUserData }