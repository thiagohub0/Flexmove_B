/*
  Warnings:

  - You are about to alter the column `flag` on the `Chat` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Boolean`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Chat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "mensagem" TEXT NOT NULL,
    "horario" TEXT NOT NULL,
    "dia" TEXT NOT NULL,
    "flag" BOOLEAN NOT NULL,
    "consulta_id" INTEGER NOT NULL,
    CONSTRAINT "Chat_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Chat" ("consulta_id", "dia", "flag", "horario", "id", "mensagem") SELECT "consulta_id", "dia", "flag", "horario", "id", "mensagem" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
CREATE UNIQUE INDEX "Chat_consulta_id_key" ON "Chat"("consulta_id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
