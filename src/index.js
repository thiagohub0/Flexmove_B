const express = require("express");
const { rotasUsuarios } = require("./controller/usuario");
const { rotasConsultas } = require("./controller/consulta");
const { rotasChats } = require("./controller/chat");
const { rotasPlanos } = require("./controller/plano");
const { rotasMensagens } = require("./controller/mensagem");

const server = express();

server.use(express.json());

server.use(rotasUsuarios);
server.use(rotasConsultas);
server.use(rotasChats);
server.use(rotasPlanos);
server.use(rotasMensagens);

server.listen(3000, () => console.log("rodando"));
