const express = require("express");
const { rotasUsuarios } = require("./controller/usuario");
const { rotasConsultas } = require("./controller/consulta");
const { rotasChats } = require("./controller/chat");
const { rotasPlanos } = require("./controller/plano");
const { rotasMensagens } = require("./controller/mensagem");
var cors = require("cors");
const { db } = require("./db");
const jwt = require("jsonwebtoken");
const { chaveSecreta } = require("./autenticacao");
const { rotasPaginas } = require("./controller/paginas");

const server = express();

server.use(cors());
server.use(express.json());
server.use(express.static("assets"));

server.use(rotasPaginas);
server.use(rotasUsuarios);
server.use(rotasConsultas);
server.use(rotasChats);
server.use(rotasPlanos);
server.use(rotasMensagens);
server.post("/login", async (req, res) => {
  const { email, senha } = req.body;

  const usuario = await db.usuario.findFirst({
    where: {
      email,
    },
  });

  if (!usuario) {
    res.status(401).send({
      mensagem: "usuario ou senha inválido!",
    });
    return;
  }

  if (usuario.senha !== senha) {
    res.status(401).send({
      mensagem: "usuario ou senha inválido!",
    });
    return;
  }

  const token = jwt.sign({ id: usuario.id }, chaveSecreta);

  res.status(200).json({
    token,
  });
});

server.listen(3000, () => console.log("rodando"));
