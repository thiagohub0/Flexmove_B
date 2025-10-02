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
    "certificado" TEXT,
    "tipo" TEXT NOT NULL,
    "especializacao" TEXT,
    "avatar" TEXT NOT NULL
);
INSERT INTO "new_Usuario" ("avatar", "certificado", "data_de_nascimento", "email", "especializacao", "id", "nome", "senha", "telefone", "tipo") SELECT "avatar", "certificado", "data_de_nascimento", "email", "especializacao", "id", "nome", "senha", "telefone", "tipo" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
