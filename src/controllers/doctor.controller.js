import { deleteOne, getAll, getOne, updateOne } from "./factory.controller.js";
import asyncHandler from "express-async-handler";
import prisma from "../config/prisma.config.js";
export const createDoctor = asyncHandler(async (req, res, next) => {
  const { doctor_name, speciality, location, town, contact, facility } =
    req.body;
  try {
    const item = await prisma.doctor.create({
      data: {
        doctor_name,
        speciality,
        location,
        town,
        contact,
        facility: {
          connect: {
            id: facility,
          },
        },
      },
    });
    if (!item) {
      return next(new Error(`The facility has failed to create.`));
    }
    res.status(201).send({ status: "success", data: item });
  } catch (err) {
    res
      .status(500)
      .json({ error: "Internal Server Error", message: err.message });
  }
});
export const getDoctor = getOne("doctor");
export const getAllDoctor = getAll("doctor");
export const deleteDoctor = deleteOne("doctor");
export const updateDoctor = updateOne("doctor");
