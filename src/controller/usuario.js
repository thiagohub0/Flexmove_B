const { Router } = require("express");
const { db } = require("../db");
const { autenticacao } = require("../autenticacao");
const rotasUsuarios = Router();

rotasUsuarios.get("/usuarios", async (req, res) => {
  const usuarios = await db.usuario.findMany();
  res.json(usuarios);
});

rotasUsuarios.post("/usuarios", async (req, res) => {
  const {
    nome,
    email,
    senha,
    telefone,
    data_de_nascimento,
    certificado,
    avatar,
    especializacao,
    tipo,
  } = req.body;

  await db.usuario.create({
    data: {
      nome,
      email,
      senha,
      telefone,
      data_de_nascimento,
      certificado,
      avatar,
      especializacao,
      tipo,
    },
  });
  res.json({ sucesso: "ok" });
});

rotasUsuarios.delete("/usuarios/:id",  autenticacao,async (req, res) => {
  await db.usuario.delete({
    where: { id: Number(req.params.id) },
    include: { planos: true },
  });
  res.json({ sucesso: "ok" });
});

rotasUsuarios.put("/usuarios/:id", async (req, res) => {
  const id = req.params.id;
  const data = {};

  if (req.body.nome) data.nome = req.body.nome;
  if (req.body.email) data.email = req.body.email;
  if (req.body.senha) data.senha = req.body.senha;
  if (req.body.telefone) data.telefone = req.body.telefone;
  if (req.body.data_de_nascimento)
    data.data_de_nascimento = req.body.data_de_nascimento;
  if (req.body.certificado) data.certificado = req.body.certificado;
  if (req.body.avatar) data.avatar = req.body.avatar;
  if (req.body.especializacao) data.especializacao = req.body.especializacao;
  if (req.body.tipo) data.tipo = req.body.tipo;

  await db.usuario.update({ where: { id: Number(id) }, data });
  res.json({ sucesso: "ok" });
});

module.exports = { rotasUsuarios };
