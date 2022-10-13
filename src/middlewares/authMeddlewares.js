import joi from "joi";

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

export { authValidationSignUp, authValidationSignIn}