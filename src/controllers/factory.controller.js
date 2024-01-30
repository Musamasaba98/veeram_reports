import prisma from "../config/prisma.config.js";
import { toSentenceCase } from "../utils/toSentenceCase.js";
import asyncHandler from "express-async-handler";

export const deleteOne = (Model) =>
  asyncHandler(async (req, res, next) => {
    const id = req.params.id;

    const deleted = await prisma[Model].delete({
      where: {
        id: id,
      },
    });
    if (!deleted) {
      return next(new Error(`There is no ${Model} with that ID ${id}`, 404));
    }
    res.status(204).json({
      status: "success",
      message: `${toSentenceCase(Model)} has successfully been deleted`,
    });
  });
export const createOne = (Model) =>
  asyncHandler(async (req, res, next) => {
    const item = await prisma[Model].create({
      data: req.body,
    });
    if (!item) {
      return next(new Error(`The ${Model} has failed to create.`));
    }
    res.status(201).send({ status: "success", data: item });
  });
export const updateOne = (Modal) =>
  asyncHandler(async (req, res, next) => {
    const updated = await prisma[Modal].update({
      where: {
        id: req.params.id,
      },
      data: req.body,
    });
    if (!updated) {
      return next(
        new Error(`There is no ${Modal} with that ID ${req.params.id}`, 404)
      );
    }
    res.status(200).json({ status: "success", data: updated });
  });

export const getOne = (Modal) =>
  asyncHandler(async (req, res, next) => {
    const item = await prisma[Modal].findUnique({
      where: {
        id: req.params.id,
      },
    });
    if (!item) {
      return next(
        new Error(`There is no ${Modal} with that ID ${req.params.id}`, 404)
      );
    }
    res.status(200).json({ status: "success", data: item });
  });
export const getAll = (Modal) =>
  asyncHandler(async (req, res) => {
    const items = await prisma[Modal].findMany();
    res
      .status(200)
      .json({ status: "success", results: items.length, data: items });
  });
