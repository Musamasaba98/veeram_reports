import prisma from "../config/prisma.config.js";
import asyncHandler from "express-async-handler";

export const createPharmacyActivity = asyncHandler(async (req, res) => {
  try {
    const { user_id, pharmacy_id, products_in_stock, stock_tracking } =
      req.body;

    const pharmacyActivity = await prisma.pharmacyActivity.create({
      data: {
        user: { connect: { id: user_id } },
        pharmacy: { connect: { id: pharmacy_id } },
        products_in_stock: { connect: { id: products_in_stock[0] } },
        stock_tracking: {
          create: {
            pharmacy: pharmacy_id,
            product: products_in_stock[0],
            quantity: 50,
            pharmacy: {
              connect: { id: pharmacy_id },
            },
            product: {
              connect: { id: products_in_stock[0] },
            },
          },
        },
      },
    });

    res.status(201).json({ success: true, data: pharmacyActivity });
  } catch (error) {
    console.error("Error creating pharmacy activity:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});
