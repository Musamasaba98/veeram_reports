import { deleteOne, getAll, getOne, updateOne } from "./factory.controller.js";
import asyncHandler from "express-async-handler";
import prisma from "../config/prisma.config.js";

export const createSampleDistribution = asyncHandler(async (req, res) => {
  try {
    const { user_id, doctor_id, product_id, samples_given, date } = req.body;

    const sample = await prisma.sampleDistribution.create({
      data: {
        user: { connect: { id: user_id } },
        doctor: { connect: { id: doctor_id } },
        product: { connect: { id: product_id } },
        samples_given,
        date: new Date(date),
      },
    });

    res.status(201).json({ success: true, data: sample });
  } catch (error) {
    console.error("Error adding sample:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});
export const getSampleDistribution = getOne("sampledistribution");
export const getAllSampleDistribution = getAll("sampledistribution");
export const deleteSampleDistribution = deleteOne("sampledistribution");
export const updateSampleDistribution = updateOne("sampledistribution");
