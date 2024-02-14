/*
  Warnings:

  - You are about to drop the `_DoctorToFacility` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_DoctorToFacility" DROP CONSTRAINT "_DoctorToFacility_A_fkey";

-- DropForeignKey
ALTER TABLE "_DoctorToFacility" DROP CONSTRAINT "_DoctorToFacility_B_fkey";

-- AlterTable
ALTER TABLE "Facility" ADD COLUMN     "doctor_id" TEXT;

-- DropTable
DROP TABLE "_DoctorToFacility";

-- AddForeignKey
ALTER TABLE "Facility" ADD CONSTRAINT "Facility_doctor_id_fkey" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("id") ON DELETE SET NULL ON UPDATE CASCADE;
