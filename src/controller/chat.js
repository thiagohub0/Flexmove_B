const { Router } = require("express");
const { db } = require("../db");
const rotasChats = Router();

rotasChats.get("/chats", async (req, res) => {
  const chats = await db.chat.findMany();
  res.json(chats);
});

rotasChats.post("/chats", async (req, res) => {
  const { consulta_id } = req.body;

  await db.chat.create({
    data: {
      consulta: {
        connect: {
          id: consulta_id,
        },
      },
    },
  });
  res.json({ sucesso: "ok" });
});

rotasChats.delete("/chats/:id", async (req, res) => {
  await db.chat.delete({
    where: { id: Number(req.params.id) },
    include: { consultas: true },
  });
  res.json({ sucesso: "ok" });
});

rotasChats.put("/chats/:id", async (req, res) => {
  const id = req.params.id;
  const data = {};

  if (req.body.consulta_id) data.consulta_id = req.body.consulta_id;

  await db.chat.update({ where: id, data });
  res.json({ sucesso: "ok" });
});

module.exports = { rotasChats };
