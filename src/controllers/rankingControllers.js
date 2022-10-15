import connection from "../db/db.js";

async function getRanking(req, res) {
  try {
    const ranking = (
      await connection.query(`SELECT 
        "userId", 
        users.name,
        COUNT("userId") AS "linksCount",	 
        SUM("countVisit") AS "visitCount"
    FROM ranking LEFT JOIN users ON ranking."userId"=users.id 
        GROUP BY "userId", users.name 
        ORDER BY "visitCount" desc LIMIT 10; `)
    ).rows;
  
    return res.status(200).send(ranking);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

export { getRanking };
