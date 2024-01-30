/*
  Warnings:

  - The primary key for the `Company` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `company_id` on the `Company` table. All the data in the column will be lost.
  - The primary key for the `Doctor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `doctor_id` on the `Doctor` table. All the data in the column will be lost.
  - The primary key for the `Facility` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `facility_id` on the `Facility` table. All the data in the column will be lost.
  - The primary key for the `Manager` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `manager_id` on the `Manager` table. All the data in the column will be lost.
  - The primary key for the `ManagerProfile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `profile_id` on the `ManagerProfile` table. All the data in the column will be lost.
  - The primary key for the `MedicalRep` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `medical_rep_id` on the `MedicalRep` table. All the data in the column will be lost.
  - The primary key for the `MedicalRepProfile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `profile_id` on the `MedicalRepProfile` table. All the data in the column will be lost.
  - The primary key for the `Pharmacy` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `pharmacy_id` on the `Pharmacy` table. All the data in the column will be lost.
  - The primary key for the `Product` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `product_id` on the `Product` table. All the data in the column will be lost.
  - The primary key for the `Profile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `profile_id` on the `Profile` table. All the data in the column will be lost.
  - The primary key for the `Supervisor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `supervisor_id` on the `Supervisor` table. All the data in the column will be lost.
  - The primary key for the `SupervisorProfile` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `profile_id` on the `SupervisorProfile` table. All the data in the column will be lost.
  - The primary key for the `Team` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `team_id` on the `Team` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `user_id` on the `User` table. All the data in the column will be lost.
  - The required column `id` was added to the `Company` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Doctor` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Facility` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Manager` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `ManagerProfile` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `MedicalRep` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `MedicalRepProfile` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Pharmacy` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Product` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Profile` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Supervisor` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `SupervisorProfile` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `Team` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - The required column `id` was added to the `User` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

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
ALTER TABLE "DailyPlan" DROP CONSTRAINT "DailyPlan_user_id_fkey";

-- DropForeignKey
ALTER TABLE "ManagerProfile" DROP CONSTRAINT "ManagerProfile_managerManager_id_fkey";

-- DropForeignKey
ALTER TABLE "ManagerProfile" DROP CONSTRAINT "ManagerProfile_userUser_id_fkey";

-- DropForeignKey
ALTER TABLE "MedicalRepProfile" DROP CONSTRAINT "MedicalRepProfile_medicalRepMedical_rep_id_fkey";

-- DropForeignKey
ALTER TABLE "MedicalRepProfile" DROP CONSTRAINT "MedicalRepProfile_userUser_id_fkey";

-- DropForeignKey
ALTER TABLE "MonthlyPlan" DROP CONSTRAINT "MonthlyPlan_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_company_id_fkey";

-- DropForeignKey
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_doctor_id_fkey";

-- DropForeignKey
ALTER TABLE "SampleDistribution" DROP CONSTRAINT "SampleDistribution_doctor_id_fkey";

-- DropForeignKey
ALTER TABLE "SampleDistribution" DROP CONSTRAINT "SampleDistribution_product_id_fkey";

-- DropForeignKey
ALTER TABLE "SampleDistribution" DROP CONSTRAINT "SampleDistribution_user_id_fkey";

-- DropForeignKey
ALTER TABLE "StockTracking" DROP CONSTRAINT "StockTracking_pharmacy_id_fkey";

-- DropForeignKey
ALTER TABLE "StockTracking" DROP CONSTRAINT "StockTracking_product_id_fkey";

-- DropForeignKey
ALTER TABLE "SupervisorProfile" DROP CONSTRAINT "SupervisorProfile_supervisor_id_fkey";

-- DropForeignKey
ALTER TABLE "SupervisorProfile" DROP CONSTRAINT "SupervisorProfile_userUser_id_fkey";

-- DropForeignKey
ALTER TABLE "TeamProduct" DROP CONSTRAINT "TeamProduct_product_id_fkey";

-- DropForeignKey
ALTER TABLE "TeamProduct" DROP CONSTRAINT "TeamProduct_team_id_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_company_id_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_team_id_fkey";

-- DropForeignKey
ALTER TABLE "_DailyActivityToTeam" DROP CONSTRAINT "_DailyActivityToTeam_B_fkey";

-- DropForeignKey
ALTER TABLE "_DoctorToFacility" DROP CONSTRAINT "_DoctorToFacility_A_fkey";

-- DropForeignKey
ALTER TABLE "_DoctorToFacility" DROP CONSTRAINT "_DoctorToFacility_B_fkey";

-- DropForeignKey
ALTER TABLE "_FacilityToUser" DROP CONSTRAINT "_FacilityToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_FacilityToUser" DROP CONSTRAINT "_FacilityToUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_MonthlyPlanToTeam" DROP CONSTRAINT "_MonthlyPlanToTeam_B_fkey";

-- AlterTable
ALTER TABLE "Company" DROP CONSTRAINT "Company_pkey",
DROP COLUMN "company_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Company_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Doctor" DROP CONSTRAINT "Doctor_pkey",
DROP COLUMN "doctor_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Facility" DROP CONSTRAINT "Facility_pkey",
DROP COLUMN "facility_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Facility_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Manager" DROP CONSTRAINT "Manager_pkey",
DROP COLUMN "manager_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Manager_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "ManagerProfile" DROP CONSTRAINT "ManagerProfile_pkey",
DROP COLUMN "profile_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "ManagerProfile_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "MedicalRep" DROP CONSTRAINT "MedicalRep_pkey",
DROP COLUMN "medical_rep_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "MedicalRep_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "MedicalRepProfile" DROP CONSTRAINT "MedicalRepProfile_pkey",
DROP COLUMN "profile_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "MedicalRepProfile_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Pharmacy" DROP CONSTRAINT "Pharmacy_pkey",
DROP COLUMN "pharmacy_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Pharmacy_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Product" DROP CONSTRAINT "Product_pkey",
DROP COLUMN "product_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Profile" DROP CONSTRAINT "Profile_pkey",
DROP COLUMN "profile_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Profile_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Supervisor" DROP CONSTRAINT "Supervisor_pkey",
DROP COLUMN "supervisor_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Supervisor_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "SupervisorProfile" DROP CONSTRAINT "SupervisorProfile_pkey",
DROP COLUMN "profile_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "SupervisorProfile_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Team" DROP CONSTRAINT "Team_pkey",
DROP COLUMN "team_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "Team_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "user_id",
ADD COLUMN     "id" TEXT NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupervisorProfile" ADD CONSTRAINT "SupervisorProfile_userUser_id_fkey" FOREIGN KEY ("userUser_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SupervisorProfile" ADD CONSTRAINT "SupervisorProfile_supervisor_id_fkey" FOREIGN KEY ("supervisor_id") REFERENCES "Supervisor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ManagerProfile" ADD CONSTRAINT "ManagerProfile_userUser_id_fkey" FOREIGN KEY ("userUser_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ManagerProfile" ADD CONSTRAINT "ManagerProfile_managerManager_id_fkey" FOREIGN KEY ("managerManager_id") REFERENCES "Manager"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicalRepProfile" ADD CONSTRAINT "MedicalRepProfile_userUser_id_fkey" FOREIGN KEY ("userUser_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MedicalRepProfile" ADD CONSTRAINT "MedicalRepProfile_medicalRepMedical_rep_id_fkey" FOREIGN KEY ("medicalRepMedical_rep_id") REFERENCES "MedicalRep"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_doctor_id_fkey" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeamProduct" ADD CONSTRAINT "TeamProduct_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TeamProduct" ADD CONSTRAINT "TeamProduct_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTracking" ADD CONSTRAINT "StockTracking_pharmacy_id_fkey" FOREIGN KEY ("pharmacy_id") REFERENCES "Pharmacy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StockTracking" ADD CONSTRAINT "StockTracking_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SampleDistribution" ADD CONSTRAINT "SampleDistribution_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SampleDistribution" ADD CONSTRAINT "SampleDistribution_doctor_id_fkey" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SampleDistribution" ADD CONSTRAINT "SampleDistribution_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyActivity" ADD CONSTRAINT "DailyActivity_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyActivity" ADD CONSTRAINT "DailyActivity_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyActivity" ADD CONSTRAINT "DailyActivity_doctor_id_fkey" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyActivity" ADD CONSTRAINT "DailyActivity_pharmacy_id_fkey" FOREIGN KEY ("pharmacy_id") REFERENCES "Pharmacy"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyActivity" ADD CONSTRAINT "DailyActivity_focused_product_id_fkey" FOREIGN KEY ("focused_product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DailyPlan" ADD CONSTRAINT "DailyPlan_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MonthlyPlan" ADD CONSTRAINT "MonthlyPlan_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DoctorToFacility" ADD CONSTRAINT "_DoctorToFacility_A_fkey" FOREIGN KEY ("A") REFERENCES "Doctor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DoctorToFacility" ADD CONSTRAINT "_DoctorToFacility_B_fkey" FOREIGN KEY ("B") REFERENCES "Facility"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DailyActivityToTeam" ADD CONSTRAINT "_DailyActivityToTeam_B_fkey" FOREIGN KEY ("B") REFERENCES "Team"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MonthlyPlanToTeam" ADD CONSTRAINT "_MonthlyPlanToTeam_B_fkey" FOREIGN KEY ("B") REFERENCES "Team"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FacilityToUser" ADD CONSTRAINT "_FacilityToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Facility"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FacilityToUser" ADD CONSTRAINT "_FacilityToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
