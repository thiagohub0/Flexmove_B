/*
  Warnings:

  - You are about to drop the column `flag` on the `Chat` table. All the data in the column will be lost.
  - You are about to drop the column `mensagem` on the `Chat` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "Mensagem" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "palavras" TEXT NOT NULL,
    "enviada_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "chat_id" INTEGER NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    CONSTRAINT "Mensagem_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "Chat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Mensagem_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Chat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "horario" TEXT NOT NULL,
    "dia" TEXT NOT NULL,
    "consulta_id" INTEGER NOT NULL,
    CONSTRAINT "Chat_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Chat" ("consulta_id", "dia", "horario", "id") SELECT "consulta_id", "dia", "horario", "id" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
CREATE UNIQUE INDEX "Chat_consulta_id_key" ON "Chat"("consulta_id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
