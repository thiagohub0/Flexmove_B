const { Router } = require("express");
const rotasPaginas = Router();

rotasPaginas.get("/", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela1.html");
});

rotasPaginas.get("/usu", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela2.html");
});

rotasPaginas.get("/prof", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela3.html");
});

rotasPaginas.get("/inicial", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela4.html");
});

rotasPaginas.get("/opc", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela5.html");
});

rotasPaginas.get("/exers", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela6.html");
});

rotasPaginas.get("/exer", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela7.html");
});

rotasPaginas.get("/concl", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela8.html");
});

rotasPaginas.get("/conta", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela9.html");
});

rotasPaginas.get("/suporte", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela10.html");
});

rotasPaginas.get("/login", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela11.html");
});

rotasPaginas.get("/chat", async (req, res) => {
  res.sendFile(__dirname + "/pages/tela12.html");
});

module.exports = { rotasPaginas };
