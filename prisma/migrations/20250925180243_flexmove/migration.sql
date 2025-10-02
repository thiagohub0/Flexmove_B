-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Plano" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "problema" TEXT NOT NULL,
    "categoria" TEXT NOT NULL,
    "situacao" TEXT NOT NULL
);
INSERT INTO "new_Plano" ("categoria", "id", "problema", "situacao") SELECT "categoria", "id", "problema", "situacao" FROM "Plano";
DROP TABLE "Plano";
ALTER TABLE "new_Plano" RENAME TO "Plano";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
