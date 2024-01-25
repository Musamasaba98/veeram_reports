import asyncHandler from "express-async-handler";
import ExcelJS from "exceljs";

export const generateReport = asyncHandler(async (req, res) => {
  try {
    //Create work book and add worksheet
    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet("DailyReport");
    //Add header information
    worksheet.mergeCells("A1", "C1");
    worksheet.getCell("A1").value = "NAME: Masaba Musa";
    worksheet.getCell("A1").font = { bold: true };
    worksheet.mergeCells("D1", "E1");
    worksheet.getCell("D1").value = "Date: 16/10/2023";
    worksheet.getCell("D1").font = { bold: true };
    worksheet.mergeCells("F1", "H1");
    worksheet.getCell("F1").value = "PLACE: Mulago/Wandegeya";
    worksheet.getCell("F1").font = { bold: true };
    worksheet.mergeCells("I1", "Q1");
    worksheet.getCell("I1").value = "WORKED WITH:";
    worksheet.getCell("I1").font = { bold: true };

    // Adjust column widths
    worksheet.columns = [
      { width: 10 }, // S.NO
      { width: 10 }, // CODE
      { width: 20 }, // DOCTORS NAME(S)
      { width: 10 }, // SPLTY
      { width: 10 }, // FACILITY
      { width: 10 }, // Focus Product
      { width: 10 }, // ARC
      { width: 10 }, // NFX
      { width: 10 }, // RFX
      { width: 10 }, // SNG
      { width: 10 }, // EXPECT
      { width: 10 }, // PECOS
      { width: 10 }, // BRANDS PROMOTED AND SAMPLES/INPUTS ISSUED
      { width: 10 }, // COLUMN 14
      { width: 10 }, // COLUMN 15
      { width: 10 }, // COLUMN 16
      { width: 10 }, // COLUMN 17
    ];
    //vertical merge
    worksheet.mergeCells("A2:A3");
    worksheet.mergeCells("B2:B3");
    worksheet.mergeCells("C2:C3");
    worksheet.mergeCells("D2:D3");
    worksheet.mergeCells("E2:E3");
    worksheet.mergeCells("F2:F3");
    //merge cells with products header
    worksheet.mergeCells("G2", "Q2");
    const g_cell = worksheet.getCell(2, 7);
    g_cell.alignment = { horizontal: "center" };

    //borders
    for (let row = 1; row <= 37; row++) {
      for (let col = 1; col <= 17; col++) {
        const cell = worksheet.getCell(row, col);
        cell.border = {
          top: { style: "thin" },
          left: { style: "thin" },
          bottom: { style: "thin" },
          right: { style: "thin" },
        };
      }
    }
    //preliminary data
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
    mainHeaders.forEach((header, index) => {
      let cell = worksheet.getCell(2, index + 1);
      cell.value = header;
      cell.alignment = {
        horizontal: "center",
        vertical: "middle",
        wrapText: true,
      };
      cell.width = 20;
      cell.font = { bold: true };
    });
    products.forEach((product, index) => {
      let cell = worksheet.getCell(3, 7 + index);
      cell.value = product;
      cell.alignment = { horizontal: "center" };
      cell.width = 20;
      cell.font = { bold: true };
    });
    // Add data rows
    const data = [
      [1, 89, "Kasuka Arafat", "ENT", "Mulago", "RFX", 4, "D", "D"],
      [2, null, "Kamukama Gp", "IMC", "NFX", "D"],
      [3, null, "Were Ivan Gp", "Abii", "RFX", 4, "D", "D"],
    ];
    data.forEach((row, rowIndex) => {
      row.forEach((value, columnIndex) => {
        worksheet.getCell(rowIndex + 4, columnIndex + 1).value = value;
      });
    });
    //second section of feedback and pharmacies

    // Function to generate feedback headers and cells
    function generateFeedbackSection(rowOffset) {
      worksheet.mergeCells(`A${rowOffset}`, `C${rowOffset}`);
      worksheet.getCell(`A${rowOffset}`).value = "FEEDBACK";
      worksheet.getCell(`A${rowOffset}`).font = { bold: true };
      worksheet.getCell(`A${rowOffset}`).alignment = { horizontal: "center" };
      const feedbackHeaders = [
        "Opening Qty Samples",
        "Sampled for the day",
        "Balance Samples in hand",
        "Drs Met Cummulative",
        "Cummulative call average",
        "Cummulative focus Drs met",
      ];

      // Add feedback headers
      feedbackHeaders.forEach((header, index) => {
        worksheet.mergeCells(`D${rowOffset + index}`, `E${rowOffset + index}`);
        const cell = worksheet.getCell(`D${rowOffset + index}`);
        cell.value = header;
        cell.font = { bold: true };
      });

      generatePharmacyCoverageSection(rowOffset + 7, 17);
    }

    // Function to generate pharmacy coverage cells
    function generatePharmacyCoverageSection(rowOffset) {
      const pharmacyHeaders = [
        "PHARMACY NAME",
        "CHEMIST / DISPENSER NAME",
        "CONTACT",
        "FOCUS BRANDS AVAILABILITY",
      ];
      const brandHeaders = ["ARC", "RFX", "SNG", "EXPECT"];
      worksheet.mergeCells(`G${rowOffset}`, `Q${rowOffset}`);
      // Merge cells for the first and second columns
      worksheet.mergeCells(`A${rowOffset}`, `B${rowOffset + 1}`);
      worksheet.getCell(`A${rowOffset}`).alignment = { vertical: "middle" };
      worksheet.mergeCells(`C${rowOffset}`, `D${rowOffset + 1}`);
      worksheet.getCell(`C${rowOffset}`).alignment = { vertical: "middle" };
      // Merge cells for the third and fourth columns
      worksheet.mergeCells(`E${rowOffset}`, `F${rowOffset + 1}`);
      worksheet.getCell(`E${rowOffset}`).alignment = { vertical: "middle" };

      // Add pharmacy headers
      pharmacyHeaders.forEach((header, index) => {
        let cell = worksheet.getCell(rowOffset, index * 2 + 1);
        cell.value = header;
        cell.alignment = { horizontal: "center", vertical: "middle" }; // Set vertical alignment
        cell.width = 40;
        cell.font = { bold: true };
      });

      // Shift brand headers to the right by two columns
      brandHeaders.forEach((product, index) => {
        let cell = worksheet.getCell(rowOffset + 1, 7 + index); // Adjusted indexing
        cell.value = product;
        cell.alignment = { horizontal: "center", vertical: "middle" }; // Set vertical alignment
        cell.width = 20;
        cell.font = { bold: true };
      });

      // Merge cells for each row in the columns
      for (let i = rowOffset + 2; i <= rowOffset + 9; i++) {
        worksheet.mergeCells(`A${i}`, `B${i}`);
        worksheet.mergeCells(`C${i}`, `D${i}`);
        worksheet.mergeCells(`E${i}`, `F${i}`);
      }
    }
    generateFeedbackSection(23);
    // Save the workbook to a file
    workbook.xlsx
      .writeFile("daily_report.xlsx")
      .then(() => {
        res.send("Excel file created successfully.");
      })
      .catch((error) => {
        console.error("Error creating Excel file:", error);
      });
  } catch (error) {
    throw new Error(error);
  }
});
