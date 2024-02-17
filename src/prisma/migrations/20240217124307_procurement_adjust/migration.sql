/*
  Warnings:

  - You are about to drop the column `month` on the `MonthlyPlan` table. All the data in the column will be lost.
  - You are about to drop the column `year` on the `MonthlyPlan` table. All the data in the column will be lost.
  - The primary key for the `StockTracking` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `month` on the `StockTracking` table. All the data in the column will be lost.
  - You are about to drop the column `year` on the `StockTracking` table. All the data in the column will be lost.
  - You are about to drop the `DailyActivity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_DailyActivityToTeam` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `last_edit_date` to the `Company` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `DailyPlan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Doctor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Facility` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Manager` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `MedicalRep` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `MonthlyPlan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Pharmacy` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Profile` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Supervisor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `Team` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_edit_date` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "DailyActivity" DROP CONSTRAINT "DailyActivity_doctor_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyActivity" DROP CONSTRAINT "DailyActivity_focused_product_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyActivity" DROP CONSTRAINT "DailyActivity_pharmacy_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyActivity" DROP CONSTRAINT "DailyActivity_product_id_fkey";

-- DropForeignKey
ALTER TABLE "DailyActivity" DROP CONSTRAINT "DailyActivity_user_id_fkey";

-- DropForeignKey
ALTER TABLE "_DailyActivityToTeam" DROP CONSTRAINT "_DailyActivityToTeam_A_fkey";

-- DropForeignKey
ALTER TABLE "_DailyActivityToTeam" DROP CONSTRAINT "_DailyActivityToTeam_B_fkey";

-- AlterTable
ALTER TABLE "Company" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "DailyPlan" ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "date" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Doctor" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Facility" ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Manager" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "MedicalRep" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "MonthlyPlan" DROP COLUMN "month",
DROP COLUMN "year",
ADD COLUMN     "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Pharmacy" ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "doctor_activity_id" TEXT,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "pharmacyActivityId" TEXT,
ADD COLUMN     "procurementId" TEXT;

-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "SampleDistribution" ALTER COLUMN "date" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "StockTracking" DROP CONSTRAINT "StockTracking_pkey",
DROP COLUMN "month",
DROP COLUMN "year",
ADD COLUMN     "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD CONSTRAINT "StockTracking_pkey" PRIMARY KEY ("pharmacy_id", "product_id", "date");

-- AlterTable
ALTER TABLE "Supervisor" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Team" ADD COLUMN     "date_of_creation" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "date_of_joining" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "last_edit_date" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "DailyActivity";

-- DropTable
DROP TABLE "_DailyActivityToTeam";

-- CreateTable
CREATE TABLE "DoctorActivity" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "doctor_id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "focused_product_id" TEXT NOT NULL,
    "samples_given" INTEGER NOT NULL,

    CONSTRAINT "DoctorActivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PharmacyActivity" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "pharmacy_id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "stockTrackingPharmacy_id" TEXT NOT NULL,
    "stockTrackingProduct_id" TEXT NOT NULL,
    "stockTrackingDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PharmacyActivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Procurement" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "pharmacy_id" TEXT,
    "facility_id" TEXT,
    "date" TIMESTAMP(3) NOT NULL,
    "profileId" TEXT NOT NULL,

    CONSTRAINT "Procurement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_productsDetailed" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "DoctorActivity_focused_product_id_key" ON "DoctorActivity"("focused_product_id");

-- CreateIndex
CREATE UNIQUE INDEX "_productsDetailed_AB_unique" ON "_productsDetailed"("A", "B");

-- CreateIndex
CREATE INDEX "_productsDetailed_B_index" ON "_productsDetailed"("B");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_pharmacyActivityId_fkey" FOREIGN KEY ("pharmacyActivityId") REFERENCES "PharmacyActivity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_procurementId_fkey" FOREIGN KEY ("procurementId") REFERENCES "Procurement"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DoctorActivity" ADD CONSTRAINT "DoctorActivity_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DoctorActivity" ADD CONSTRAINT "DoctorActivity_doctor_id_fkey" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DoctorActivity" ADD CONSTRAINT "DoctorActivity_focused_product_id_fkey" FOREIGN KEY ("focused_product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PharmacyActivity" ADD CONSTRAINT "PharmacyActivity_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PharmacyActivity" ADD CONSTRAINT "PharmacyActivity_pharmacy_id_fkey" FOREIGN KEY ("pharmacy_id") REFERENCES "Pharmacy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PharmacyActivity" ADD CONSTRAINT "PharmacyActivity_stockTrackingPharmacy_id_stockTrackingPro_fkey" FOREIGN KEY ("stockTrackingPharmacy_id", "stockTrackingProduct_id", "stockTrackingDate") REFERENCES "StockTracking"("pharmacy_id", "product_id", "date") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procurement" ADD CONSTRAINT "Procurement_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procurement" ADD CONSTRAINT "Procurement_pharmacy_id_fkey" FOREIGN KEY ("pharmacy_id") REFERENCES "Pharmacy"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procurement" ADD CONSTRAINT "Procurement_facility_id_fkey" FOREIGN KEY ("facility_id") REFERENCES "Facility"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Procurement" ADD CONSTRAINT "Procurement_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_productsDetailed" ADD CONSTRAINT "_productsDetailed_A_fkey" FOREIGN KEY ("A") REFERENCES "DoctorActivity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_productsDetailed" ADD CONSTRAINT "_productsDetailed_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
