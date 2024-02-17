import prisma from "../config/prisma.config.js";
import asyncHandler from "express-async-handler";

export const createDoctorActivity = asyncHandler(async (req, res) => {
  try {
    const {
      user_id,
      doctor_id,
      products_detailed,
      focused_product_id,
      samples_given,
    } = req.body;

    const doctorActivity = await prisma.doctorActivity.create({
      data: {
        user: { connect: { id: user_id } },
        doctor: { connect: { id: doctor_id } },
        products_detailed: { connect: { id: products_detailed[0] } },
        focused_product: { connect: { id: focused_product_id } },
        samples_given,
      },
    });

    res.status(201).json({ success: true, data: doctorActivity });
  } catch (error) {
    console.error("Error creating doctor activity:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});
