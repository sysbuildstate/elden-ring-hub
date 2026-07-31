/*
  Warnings:

  - You are about to drop the column `arcScaling` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `baseDamage` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `dexScaling` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `faiScaling` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `intScaling` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `strScaling` on the `Equipment` table. All the data in the column will be lost.
  - The `role` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `Build` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `Equipment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `weight` to the `Equipment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Build" DROP CONSTRAINT "Build_equipmentId_fkey";

-- DropForeignKey
ALTER TABLE "Build" DROP CONSTRAINT "Build_userId_fkey";

-- AlterTable
ALTER TABLE "Equipment" DROP COLUMN "arcScaling",
DROP COLUMN "baseDamage",
DROP COLUMN "dexScaling",
DROP COLUMN "faiScaling",
DROP COLUMN "intScaling",
DROP COLUMN "strScaling",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "scaling" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "weight" DOUBLE PRECISION NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL,
DROP COLUMN "role",
ADD COLUMN     "role" TEXT NOT NULL DEFAULT 'USER';

-- DropTable
DROP TABLE "Build";

-- DropEnum
DROP TYPE "Role";
