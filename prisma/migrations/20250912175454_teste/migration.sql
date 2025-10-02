/*
  Warnings:

  - Added the required column `avatar` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `especializacao` to the `Usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "data_de_nascimento" TEXT NOT NULL,
    "certificado" TEXT NOT NULL,
    "tipo" TEXT NOT NULL,
    "especializacao" TEXT NOT NULL,
    "avatar" TEXT NOT NULL
);
INSERT INTO "new_Usuario" ("certificado", "data_de_nascimento", "email", "id", "nome", "senha", "telefone") SELECT "certificado", "data_de_nascimento", "email", "id", "nome", "senha", "telefone" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
