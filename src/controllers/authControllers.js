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
    const { email, password } = req.body;
       
    try {
        //verifica se existe o email no banco e se a senha é válida
        const searchUser = (await connection.query(`SELECT password FROM users WHERE email = '${email}'`)).rows[0];
        if(searchUser === undefined){
            return res.sendStatus(401)
        }
        const isValidPassword = bcrypt.compareSync(password, searchUser.password);
        if(!isValidPassword){
            return res.sendStatus(401);
        }

        const token = uuid();
        const userId = (await connection.query(`SELECT id FROM users WHERE email = '${email}'`)).rows[0].id;
        
        const insertSession = await connection.query(`INSERT INTO sessions ("userId", token) VALUES ($1,$2)`, [userId, token]);
        

        return res.status(200).send({token: token});

    } catch (error) {
        console.log(error);
        res.sendStatus(500);
    }


}

export { signUp, signIn};
