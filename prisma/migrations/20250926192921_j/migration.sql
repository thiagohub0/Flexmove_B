/*
  Warnings:

  - You are about to drop the column `dia` on the `Chat` table. All the data in the column will be lost.
  - You are about to drop the column `horario` on the `Chat` table. All the data in the column will be lost.
  - You are about to drop the column `dia` on the `Consulta` table. All the data in the column will be lost.
  - You are about to drop the column `horario` on the `Consulta` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Chat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "criado_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "consulta_id" INTEGER NOT NULL,
    CONSTRAINT "Chat_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Chat" ("consulta_id", "id") SELECT "consulta_id", "id" FROM "Chat";
DROP TABLE "Chat";
ALTER TABLE "new_Chat" RENAME TO "Chat";
CREATE UNIQUE INDEX "Chat_consulta_id_key" ON "Chat"("consulta_id");
CREATE TABLE "new_Consulta" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "aceita_em" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "situacao" TEXT NOT NULL,
    "plano_id" INTEGER NOT NULL,
    CONSTRAINT "Consulta_plano_id_fkey" FOREIGN KEY ("plano_id") REFERENCES "Plano" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Consulta" ("id", "plano_id", "situacao") SELECT "id", "plano_id", "situacao" FROM "Consulta";
DROP TABLE "Consulta";
ALTER TABLE "new_Consulta" RENAME TO "Consulta";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
