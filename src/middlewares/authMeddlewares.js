import joi from "joi";
import connection from "../db/db.js";

const signUpSchema = joi.object({
  name: joi.string().min(1).required(),
  email: joi.string().required(), 
  password: joi.string().min(4).max(20).required(),
  confirmPassword: joi.string().required().valid(joi.ref('password'))
});

const signInSchema = joi.object({
  email: joi.string().required(),
  password: joi.string().min(4).max(20).required(),
});

function authValidationSignUp(req, res, next) {
  const { name, email, password, confirmPassword } = req.body;

  const validation = signUpSchema.validate(req.body);

  if (validation.error) {
    console.log(validation.error.details);
    return res.sendStatus(422);
  }
  next();
}

function authValidationSignIn (req, res, next){
  const { email, password } = req.body;
  
  const  validation = signInSchema.validate(req.body);

  if(validation.error){
    console.log(validade.error.details);
    return res.sendStatus(422);
  }
  next();

}

async function authToken (req, res, next){
  const token = req.headers.authorization?.replace('Bearer ', '');
  
  if(!token){
    return res.sendStatus(401);
  }
 
  try {
    const user = (await connection.query(`SELECT "userId" FROM sessions WHERE token = '${token}';`)).rows[0];
    
    if(user === undefined){
      return res.sendStatus(404);
    }
    const session = (await connection.query(`SELECT token FROM sessions WHERE token = '${token}';`)).rows[0]   
   
  
    res.locals.user = user.userId;
    res.locals.session = session.token;
    
    next()
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }

}

export { authValidationSignUp, authValidationSignIn, authToken}