/*
  Warnings:

  - A unique constraint covering the columns `[supervisor_id]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[manager_id]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[medical_rep_id]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `location` to the `Company` table without a default value. This is not possible if the table is not empty.
  - Added the required column `location` to the `Doctor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `town` to the `Doctor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `location` to the `Pharmacy` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `firstname` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gender` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastname` to the `User` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `role` on the `User` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('Supervisor', 'Manager', 'MedicalRep', 'USER', 'COUNTRY_MGR');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- AlterTable
ALTER TABLE "Company" ADD COLUMN     "latitude" DOUBLE PRECISION,
ADD COLUMN     "location" TEXT NOT NULL,
ADD COLUMN     "longitude" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "Doctor" ADD COLUMN     "contact" TEXT,
ADD COLUMN     "location" TEXT NOT NULL,
ADD COLUMN     "speciality" TEXT[],
ADD COLUMN     "town" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Pharmacy" ADD COLUMN     "description" TEXT,
ADD COLUMN     "location" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "contact" TEXT,
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "firstname" TEXT NOT NULL,
ADD COLUMN     "gender" "Gender" NOT NULL,
ADD COLUMN     "lastname" TEXT NOT NULL,
ADD COLUMN     "latitude" DOUBLE PRECISION,
ADD COLUMN     "longitude" DOUBLE PRECISION,
ADD COLUMN     "manager_id" TEXT,
ADD COLUMN     "medical_rep_id" TEXT,
ADD COLUMN     "supervisor_id" TEXT,
DROP COLUMN "role",
ADD COLUMN     "role" "UserRole" NOT NULL;

-- CreateTable
CREATE TABLE "SupervisorProfile" (
    "profile_id" TEXT NOT NULL,
    "bio" TEXT,
    "userUser_id" TEXT NOT NULL,
    "supervisor_id" TEXT NOT NULL,

    CONSTRAINT "SupervisorProfile_pkey" PRIMARY KEY ("profile_id")
);

-- CreateTable
CREATE TABLE "ManagerProfile" (
    "profile_id" TEXT NOT NULL,
    "bio" TEXT,
    "userUser_id" TEXT NOT NULL,
    "managerManager_id" TEXT NOT NULL,

    CONSTRAINT "ManagerProfile_pkey" PRIMARY KEY ("profile_id")
);

-- CreateTable
CREATE TABLE "MedicalRepProfile" (
    "profile_id" TEXT NOT NULL,
    "bio" TEXT,
    "userUser_id" TEXT NOT NULL,
    "medicalRepMedical_rep_id" TEXT NOT NULL,

    CONSTRAINT "MedicalRepProfile_pkey" PRIMARY KEY ("profile_id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "profile_id" TEXT NOT NULL,
    "bio" TEXT,
    "doctor_id" TEXT,
    "gender" "Gender" NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("profile_id")
);

-- CreateTable
CREATE TABLE "Supervisor" (
    "supervisor_id" TEXT NOT NULL,
    "supervisor_name" TEXT NOT NULL,

    CONSTRAINT "Supervisor_pkey" PRIMARY KEY ("supervisor_id")
);

-- CreateTable
CREATE TABLE "Manager" (
    "manager_id" TEXT NOT NULL,
    "manager_name" TEXT NOT NULL,

    CONSTRAINT "Manager_pkey" PRIMARY KEY ("manager_id")
);

-- CreateTable
CREATE TABLE "MedicalRep" (
    "medical_rep_id" TEXT NOT NULL,
    "medical_rep_name" TEXT NOT NULL,

    CONSTRAINT "MedicalRep_pkey" PRIMARY KEY ("medical_rep_id")
);

-- CreateTable
CREATE TABLE "Facility" (
    "facility_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "description" TEXT,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,

    CONSTRAINT "Facility_pkey" PRIMARY KEY ("facility_id")
);

-- CreateTable
CREATE TABLE "_DoctorToFacility" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FacilityToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "SupervisorProfile_userUser_id_key" ON "SupervisorProfile"("userUser_id");

-- CreateIndex
CREATE UNIQUE INDEX "ManagerProfile_userUser_id_key" ON "ManagerProfile"("userUser_id");

-- CreateIndex
CREATE UNIQUE INDEX "MedicalRepProfile_userUser_id_key" ON "MedicalRepProfile"("userUser_id");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_doctor_id_key" ON "Profile"("doctor_id");

-- CreateIndex
CREATE UNIQUE INDEX "_DoctorToFacility_AB_unique" ON "_DoctorToFacility"("A", "B");

-- CreateIndex
CREATE INDEX "_DoctorToFacility_B_index" ON "_DoctorToFacility"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FacilityToUser_AB_unique" ON "_FacilityToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_FacilityToUser_B_index" ON "_FacilityToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "User_supervisor_id_key" ON "User"("supervisor_id");

-- CreateIndex
CREATE UNIQUE INDEX "User_manager_id_key" ON "User"("manager_id");

-- CreateIndex
CREATE UNIQUE INDEX "User_medical_rep_id_key" ON "User"("medical_rep_id");

-- AddForeignKey
ALTER TABLE "SupervisorProfile" ADD CONSTRAINT "SupervisorProfile_userUser_id_fkey" FOREIGN KEY ("userUser_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupervisorProfile" ADD CONSTRAINT "SupervisorProfile_supervisor_id_fkey" FOREIGN KEY ("supervisor_id") REFERENCES "Supervisor"("supervisor_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ManagerProfile" ADD CONSTRAINT "ManagerProfile_userUser_id_fkey" FOREIGN KEY ("userUser_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ManagerProfile" ADD CONSTRAINT "ManagerProfile_managerManager_id_fkey" FOREIGN KEY ("managerManager_id") REFERENCES "Manager"("manager_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicalRepProfile" ADD CONSTRAINT "MedicalRepProfile_userUser_id_fkey" FOREIGN KEY ("userUser_id") REFERENCES "User"("user_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicalRepProfile" ADD CONSTRAINT "MedicalRepProfile_medicalRepMedical_rep_id_fkey" FOREIGN KEY ("medicalRepMedical_rep_id") REFERENCES "MedicalRep"("medical_rep_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_doctor_id_fkey" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("doctor_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DoctorToFacility" ADD CONSTRAINT "_DoctorToFacility_A_fkey" FOREIGN KEY ("A") REFERENCES "Doctor"("doctor_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DoctorToFacility" ADD CONSTRAINT "_DoctorToFacility_B_fkey" FOREIGN KEY ("B") REFERENCES "Facility"("facility_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FacilityToUser" ADD CONSTRAINT "_FacilityToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Facility"("facility_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FacilityToUser" ADD CONSTRAINT "_FacilityToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;
