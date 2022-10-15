import connection from "../db/db.js";
import { nanoid } from "nanoid";


async function shortenUrls(req, res) {
  const { url } = req.body;

  const { user } = res.locals;

  try {
    const shortUrl = nanoid(8);

    const insertLink = await connection.query(
      `INSERT INTO links (url, "createAt", "shortUrl", "visitCount", "userId") VALUES ($1, CURRENT_DATE, $2,$3, $4);`,
      [url, shortUrl, null, user]
    );
    //add no ranking
    const findShortUrl = (
      await connection.query(`SELECT * FROM links WHERE "shortUrl"=$1;`, [shortUrl])
    ).rows[0];

    await connection.query(`INSERT INTO ranking ("userId", "urlId", "countVisit" ) VALUES ($1, $2, $3);`, [findShortUrl.userId,findShortUrl.id, 0]);

    res.status(201).send({ shortUrl: shortUrl });
  } catch (error) {
    console.log(error);
    res.sendStatus(422);
  }
}

async function listUrlById(req, res) {
  const { id } = req.params;

  try {
    const listUrls = (
      await connection.query(
        `SELECT id,"shortUrl", url FROM links WHERE id=$1;`,
        [id]
      )
    ).rows[0];

    if (listUrls === undefined) {
      return res.sendStatus(404);
    }

    return res.status(200).send(listUrls);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

async function openShortUrl(req, res) {
  const { shortUrl } = req.params;

  try {
    const findShortUrl = (
      await connection.query(`SELECT * FROM links WHERE "shortUrl"=$1;`, [
        shortUrl,
      ])
    ).rows[0];

    if (findShortUrl === undefined) {
      return res.sendStatus(404);
    }
    const countVisit = findShortUrl.visitCount + 1;

    await connection.query(
      `UPDATE links SET "visitCount" = $1 WHERE "shortUrl"='${shortUrl}';`,
      [countVisit]
    );
    const originalUrl = findShortUrl.url;
   
  // const ranking = (await connection.query(`SELECT * FROM ranking WHERE "urlId" = $1;`,[findShortUrl.id])).rowCount;
   //console.log(ranking)
  await connection.query(`UPDATE ranking SET "countVisit"=$1 WHERE "urlId"=$2;`, [countVisit,findShortUrl.id])
  /*if(ranking === 0){
    await connection.query(`INSERT INTO ranking ("userId", "urlId", "countVisit" ) VALUES ($1, $2, $3);`, [findShortUrl.userId,findShortUrl.id, countVisit]);
   }else{
    
   }*/

    return res.redirect(originalUrl);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

async function deleteUrl(req, res) {
  const { id } = req.params;
  const { user } = res.locals; //userId

  try {
    const findUrl = (
      await connection.query(`SELECT * FROM links WHERE id = $1;`, [id])
    ).rows[0];

    if (findUrl === undefined) {
      return res.sendStatus(404);
    }

    if (findUrl.userId !== user) {
      return res.sendStatus(401);
    }

    const deleteUrl = await connection.query(
      `DELETE FROM links WHERE id = $1;`,
      [id]
    );
    return res.sendStatus(204);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

export { shortenUrls, listUrlById, openShortUrl, deleteUrl };
