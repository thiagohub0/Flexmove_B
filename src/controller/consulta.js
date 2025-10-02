const { Router } = require("express");
const { db } = require("../db");
const { autenticacao } = require("../autenticacao");
const rotasConsultas = Router();

rotasConsultas.get("/consultas", async (req, res) => {
  const consultas = await db.consulta.findMany();
  res.json(consultas);
});

rotasConsultas.post("/consultas", async (req, res) => {
  const { situacao, chat, plano_id } = req.body;

  await db.consulta.create({
    data: {
      situacao,
      chat,
      plano: {
        connect: {
          id: plano_id,
        },
      },
    },
  });
  res.json({ sucesso: "ok" });
});

rotasConsultas.delete("/consultas/:id",autenticacao, async (req, res) => {
  await db.consulta.delete({
    where: { id: Number(req.params.id) },
  });
  res.json({ sucesso: "ok" });
});

rotasConsultas.put("/consultas/:id",autenticacao, async (req, res) => {
  const id = req.params.id;
  const data = {};

  if (req.body.situacao) data.situacao = req.body.situacao;
  if (req.body.plano_id) data.plano_id = req.body.plano_id;
  if (req.body.chat) data.chat = req.body.chat;

  await db.consulta.update({ where: id, data });
  res.json({ sucesso: "ok" });
});

module.exports = { rotasConsultas };
