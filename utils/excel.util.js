import ExcelJS from "exceljs";

// Function to create a workbook with a given name
export const createWorkbook = () => {
  const workbook = new ExcelJS.Workbook();
  return workbook;
};

// Function to add a worksheet to the workbook with specified name
export const addWorksheet = (workbook, sheetName) => {
  const worksheet = workbook.addWorksheet(sheetName);
  return worksheet;
};

// Function to apply borders to all cells in a worksheet
export const addCellBorders = (worksheet, numRows, numCols) => {
  for (let row = 1; row <= numRows; row++) {
    for (let col = 1; col <= numCols; col++) {
      const cell = worksheet.getCell(row, col);
      cell.border = {
        top: { style: "thin" },
        left: { style: "thin" },
        bottom: { style: "thin" },
        right: { style: "thin" },
      };
    }
  }
};

// Function to merge cells and apply formatting to header cells
export const mergeAndFormatHeader = (worksheet, start, end, text) => {
  worksheet.mergeCells(start, end);
  const cell = worksheet.getCell(start);
  cell.value = text;
  cell.font = { bold: true };
  cell.alignment = { horizontal: "center", vertical: "middle", wrapText: true };
};

// Function to set the column widths of a worksheet
export const setColumnWidths = (worksheet, columnWidths) => {
  worksheet.columns = columnWidths.map((width) => ({ width }));
};

// Function to add data to a worksheet
export const addDataRows = (worksheet, data, startRow) => {
  data.forEach((row, rowIndex) => {
    row.forEach((value, columnIndex) => {
      worksheet.getCell(rowIndex + startRow, columnIndex + 1).value = value;
    });
  });
};

export const addHeaders = (worksheet, headers, row, alignment, bold) => {
  headers.forEach((header, index) => {
    const cell = worksheet.getCell(row,index+1);
    cell.value = header;
    cell.alignment = { ...alignment };
    cell.font = { bold };
  });
};
export const addProductHeaders = (worksheet, headers, row, alignment, bold) => {
  headers.forEach((header, index) => {
    const cell = worksheet.getCell(row,index+7);
    cell.value = header;
    cell.alignment = { ...alignment };
    cell.font = { bold };
  });
};

// Function to set the alignment of a cell
export const setCellAlignment = (cell, alignment) => {
  cell.alignment = { ...alignment };
};