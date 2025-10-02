-- CreateTable
CREATE TABLE "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "data_de_nascimento" TEXT NOT NULL,
    "certificado" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Plano" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "problema" TEXT NOT NULL,
    "categoria" TEXT NOT NULL,
    "situacao" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Consulta" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "dia" TEXT NOT NULL,
    "horario" TEXT NOT NULL,
    "situacao" TEXT NOT NULL,
    "plano_id" INTEGER NOT NULL,
    CONSTRAINT "Consulta_plano_id_fkey" FOREIGN KEY ("plano_id") REFERENCES "Plano" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Chat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "mensagem" TEXT NOT NULL,
    "horario" TEXT NOT NULL,
    "dia" TEXT NOT NULL,
    "flag" INTEGER NOT NULL,
    "consulta_id" INTEGER NOT NULL,
    CONSTRAINT "Chat_consulta_id_fkey" FOREIGN KEY ("consulta_id") REFERENCES "Consulta" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_PlanoToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_PlanoToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "Plano" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_PlanoToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuario" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Chat_consulta_id_key" ON "Chat"("consulta_id");

-- CreateIndex
CREATE UNIQUE INDEX "_PlanoToUsuario_AB_unique" ON "_PlanoToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_PlanoToUsuario_B_index" ON "_PlanoToUsuario"("B");
