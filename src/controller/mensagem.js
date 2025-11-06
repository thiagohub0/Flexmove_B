const { Router } = require("express");
const { db } = require("../db");
const { autenticacao } = require("../autenticacao");
const rotasMensagens = Router();

rotasMensagens.get("/mensagens", async (req, res) => {
  const mensagens = await db.mensagem.findMany();
  res.json(mensagens);
});

rotasMensagens.post("/mensagens", async (req, res) => {
  const { palavras, chat_id, usuario_id } = req.body;

  await db.mensagem.create({
    data: {
      palavras,
      chat_id,
      usuario_id,
    },
  });
  res.json({ sucesso: "ok" });
});

rotasMensagens.delete("/mensagens/:id", autenticacao, async (req, res) => {
  await db.res.json({ sucesso: "ok" });
});

rotasMensagens.put("/mensagens/:id", async (req, res) => {
  const id = req.params.id;
  const data = {};

  if (req.body.palavras) data.palavras = req.body.palavras;
  if (req.body.chat_id) data.chat_id = req.body.chat_id;
  if (req.body.usuario_id) data.usuario_id = req.body.usuario_id;

  await db.mensagem.update({
    where: {
      id: Number(id),
    },
    data,
  });
  res.json({ sucesso: "ok" });
});

module.exports = { rotasMensagens };
