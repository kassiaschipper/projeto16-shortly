import connection from "../db/db.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

async function signUp(req, res) {
  const { name, email, password, confirmPassword } = req.body;
  
    const encrypetedPassword = bcrypt.hashSync(password, 10);

  try {
    const searchEmail = (
      (await connection.query(`SELECT * FROM users WHERE email = '${email}';`)).rowCount
    );
    
     if (searchEmail > 0) {
       return res.sendStatus(409);
     }

    const insertUser = await connection.query(
      "INSERT INTO users (name, email, password) VALUES ($1, $2, $3)",
      [name, email, encrypetedPassword]
    );
    res.sendStatus(201);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}

async function signIn(req, res) {

    try {
        
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }


}

export { signUp, signIn};
