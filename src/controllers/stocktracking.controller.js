import { deleteOne, getAll, getOne, updateOne } from "./factory.controller.js";
import asyncHandler from "express-async-handler";
import prisma from "../config/prisma.config.js";

export const createStockTracking = asyncHandler(async (req, res) => {
  try {
    const { pharmacy_id, product_id, quantity } = req.body;

    const stock = await prisma.stockTracking.create({
      data: {
        quantity,
        pharmacy: { connect: { id: pharmacy_id } },
        product: { connect: { id: product_id } },
      },
    });

    res.status(201).json({ success: true, data: stock });
  } catch (error) {
    console.error("Error adding sample:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});
export const getStockTracking = getOne("stocktracking");
export const getAllStockTracking = getAll("stocktracking");
export const deleteStockTracking = deleteOne("stocktracking");
export const updateStockTracking = updateOne("stocktracking");
