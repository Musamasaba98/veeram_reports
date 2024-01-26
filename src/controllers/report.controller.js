import asyncHandler from "express-async-handler";


import {
  createWorksheet,
  generateFeedbackSection,
  generatePharmacyCoverageSection,
} from "../utils/worksheet.util.js";
import { createWorkbook } from "../utils/excel.util.js";

export const generateReport = asyncHandler(async (req, res) => {
  try {
    const workbook = createWorkbook()

    workbook.creator = "Masaba Musa";
    workbook.lastModifiedBy = "Your Name";
    workbook.created = new Date();
    workbook.modified = new Date();

    const mainHeaders = [
      "S.NO",
      "CODE",
      `DOCTOR'S NAME`,
      "SPLTY",
      "FACILITY",
      "Focus Product",
      "BRANDS PROMOTED AND SAMPLES/INPUTS ISSUED",
    ];
    const products = ["ARC", "NFX", "RFX", "SNG", "EXPECT", "PECOS"];
    const data = [
      [1, 89, "Kasuka Arafat", "ENT", "Mulago", "RFX", 4, "D", "D"],
      [2, null, "Kamukama","Gp" , "IMC", "NFX", "D"],
      [3, null, "Were Ivan", "Gp", "Abii", "RFX", 4, "D", "D"],
    ];

    for (let index = 0; index <= 28; index++) {
      
      const worksheet = await createWorksheet(
      workbook,
      `February ${index+1} 2024`,
    {
    name:"Masaba Musa",
    date:"",
    place:""},
      mainHeaders,
      products,
      data
    );
    generateFeedbackSection(worksheet, 23);
    generatePharmacyCoverageSection(worksheet, 30);
    }
    
    workbook.xlsx.writeFile("daily_report.xlsx").then(() => {
      res.send("Excel file created successfully.");
    });
  } catch (error) {
    console.error("Error creating Excel file:", error);
    throw new Error(error);
  }
});


