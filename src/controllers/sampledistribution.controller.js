import { deleteOne, getAll, getOne, updateOne } from "./factory.controller.js";
import asyncHandler from "express-async-handler";
import prisma from "../config/prisma.config.js";
export const createSampleDistribution = asyncHandler(async (req, res) => {
  try {
    const { userId, doctorId, productId, samplesGiven, date } = req.body;

    const sample = await prisma.sampleDistribution.create({
      data: {
        user: { connect: { user_id: userId } },
        doctor: { connect: { doctor_id: doctorId } },
        product: { connect: { product_id: productId } },
        samples_given: samplesGiven,
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
