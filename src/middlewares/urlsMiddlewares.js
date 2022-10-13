import joi from "joi";

const urlSchema = joi.object({
    url: joi.string().required().regex(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/),
    
  });

function urlValidation(req, res, next) {
    const { url } = req.body;
  
    const validation = urlSchema.validate(req.body);
  
    if (validation.error) {
      console.log(validation.error.details);
      return res.sendStatus(422);
    }
    next();
  }

  export { urlValidation }