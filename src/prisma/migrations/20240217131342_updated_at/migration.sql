/*
  Warnings:

  - You are about to drop the column `last_edit_date` on the `Company` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `DailyPlan` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Doctor` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Facility` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Manager` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `MedicalRep` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `MonthlyPlan` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Pharmacy` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Profile` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Supervisor` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `Team` table. All the data in the column will be lost.
  - You are about to drop the column `last_edit_date` on the `User` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Pharmacy` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Company" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "DailyPlan" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Doctor" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Facility" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Manager" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "MedicalRep" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "MonthlyPlan" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Pharmacy" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Supervisor" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Team" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "User" DROP COLUMN "last_edit_date",
ADD COLUMN     "updatedAt" TIMESTAMP(3);
