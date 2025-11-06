const jwt = require("jsonwebtoken");

const chaveSecreta = "Chave-secreta-do-token-123456789";
function autenticacao(req, res, next) {
  const token = req.header("Authentication")?.replace("Bearer ", "");

  if (!token) {
    res.status(401).send("O token de acesso é necessário");
  }

  try {
    const decodificado = jwt.verify(token, chaveSecreta);
    req.decodificado = decodificado;
    next();
  } catch (err) {
    console.log(err);
    res.status(401).send("O token de acesso deve ser válido!");
  }
}
module.exports = { autenticacao, chaveSecreta };
