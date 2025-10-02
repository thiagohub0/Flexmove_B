const { Router } = require("express");
const { db } = require("../db");
const { autenticacao } = require("../autenticacao");
const rotasPlanos = Router();

rotasPlanos.get("/planos", async (req, res) => {
  const planos = await db.plano.findMany();
  res.json(planos);
});

rotasPlanos.post("/planos", async (req, res) => {
  const { problema, categoria, situacao } = req.body;

  await db.plano.create({
    data: {
      problema,
      categoria,
      situacao,
    },
  });
  res.json({ sucesso: "ok" });
});

rotasPlanos.delete("/planos/:id" ,autenticacao, async (req, res) => {
  await db.plano.delete({
    where: { id: Number(req.params.id) },
    include: { usuarios: true },
  });
  res.json({ sucesso: "ok" });
});

rotasPlanos.put("/planos/:id",autenticacao, async (req, res) => {
  const id = req.params.id;
  const data = {};

  if (req.body.problema) data.problema = req.body.problema;
  if (req.body.categoria) data.categoria = req.body.categoria;
  if (req.body.situacao) data.situacao = req.body.situacao;
  // if (req.body.usuarios) data.usuarios = req.body.usuarios;
  if (req.body.consultas) data.consultas = req.body.consultas;

  await db.plano.update({
    where: {
      id: Number(id),
    },
    data,
  });
  res.json({ sucesso: "ok" });
});

module.exports = { rotasPlanos };
