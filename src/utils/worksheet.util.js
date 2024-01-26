import {
    setColumnWidths,
    addCellBorders,
    mergeAndFormatHeader,
    setCellAlignment,
    addHeaders,
    addDataRows,
    addWorksheet,
    addProductHeaders,
  } from "./excel.util.js";
  
  export const createWorksheet = async(
    workbook,
    sheetName,
    headerInfo,
    mainHeaders,
    products,
    data
  ) => {
    const worksheet = addWorksheet(workbook,sheetName);
  try {
      // Add header information
      mergeAndFormatHeader(worksheet, "A1", "C1", `NAME: ${headerInfo.name}`);
      worksheet.getCell("A1").alignment=""
      mergeAndFormatHeader(worksheet, "D1", "E1", `Date: ${headerInfo.date}`);
      worksheet.getCell("D1").alignment=""
      mergeAndFormatHeader(worksheet, "F1", "H1", `PLACE: ${headerInfo.place}`);
      worksheet.getCell("F1").alignment=""
      mergeAndFormatHeader(worksheet, "I1", "Q1", "WORKED WITH:");
      worksheet.getCell("I1").alignment=""
    
      // Set column widths
      setColumnWidths(
        worksheet,
        [10, 10, 20, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      );
    
      // Apply borders
      addCellBorders(worksheet, 37, 17);
    
      // Merge cells for products header
      mergeAndFormatHeader(worksheet, "G2", "Q2", "");
      const gCell = worksheet.getCell(2, 7);
      setCellAlignment(gCell, { horizontal: "center" });
    
      // Preliminary data
      addHeaders(
        worksheet,
        mainHeaders,
        2,
        { horizontal: "center", vertical: "middle" },
        true
      );
      addProductHeaders(worksheet, products, 3, { horizontal: "center" }, true);
      addDataRows(worksheet, data, 4, 1);
    
      return worksheet;
  } catch (error) {
    console.error("Error adding Excel sheet:", error);
    throw new Error(error);
  }
  };
  
  export const generateFeedbackSection = (worksheet, rowOffset) => {
    mergeAndFormatHeader(worksheet, `A${rowOffset}`, `C${rowOffset}`, "FEEDBACK");
    const feedbackHeaders = [
      "Opening Qty Samples",
      "Sampled for the day",
      "Balance Samples in hand",
      "Drs Met Cummulative",
      "Cummulative call average",
      "Cummulative focus Drs met",
    ];
    mergeAndFormatHeader(worksheet, `A${rowOffset+6}`, `Q${rowOffset + 6}`, "PHARMACY COVERAGE");
    worksheet.getCell(`A${rowOffset+6}`).alignment = { horizontal: "center" };

    feedbackHeaders.forEach((header, index) => {
      mergeAndFormatHeader(
        worksheet,
        `D${rowOffset + index}`,
        `E${rowOffset + index}`,
        header
      );
      worksheet.getCell(`D${rowOffset + index}`).alignment=""
    });
};

export const generatePharmacyCoverageSection = (worksheet, rowOffset) => {
    const pharmacyHeaders = [
        "PHARMACY NAME",
        "CHEMIST / DISPENSER NAME",
        "CONTACT",
        "FOCUS BRANDS AVAILABILITY",
    ];
    const brandHeaders = ["ARC", "RFX", "SNG", "EXPECT"];
    
    mergeAndFormatHeader(worksheet, `G${rowOffset}`, `Q${rowOffset}`, "");
    
    mergeAndFormatHeader(worksheet, `A${rowOffset}`, `B${rowOffset + 1}`, "");
    worksheet.getCell(`A${rowOffset}`).alignment = { vertical: "middle" };
    
    mergeAndFormatHeader(worksheet, `C${rowOffset}`, `D${rowOffset + 1}`, "");
    worksheet.getCell(`C${rowOffset}`).alignment = { vertical: "middle" };
    
    mergeAndFormatHeader(worksheet, `E${rowOffset}`, `F${rowOffset + 1}`, "");
    
    pharmacyHeaders.forEach((header, index) => {
        let cell = worksheet.getCell(rowOffset, index * 2 + 1);
        cell.value=header
      cell.alignment = { horizontal: "center", vertical: "middle" };
      cell.width = 40;
    });
  
    brandHeaders.forEach((product, index) => {
      let cell = worksheet.getCell(rowOffset + 1, 7 + index);
      cell.value=product
      cell.font={bold:true}
      cell.alignment = { horizontal: "center", vertical: "middle" };
      cell.width = 20;
    });
  
    for (let i = rowOffset + 2; i <= rowOffset + 9; i++) {
      mergeAndFormatHeader(worksheet, `A${i}`, `B${i}`, "");
      mergeAndFormatHeader(worksheet, `C${i}`, `D${i}`, "");
      mergeAndFormatHeader(worksheet, `E${i}`, `F${i}`, "");
    }
  };