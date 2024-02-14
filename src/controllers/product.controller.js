import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller.js";
import prisma from "../config/prisma.config.js";
import asyncHandler from "express-async-handler";

export const createProduct = asyncHandler(async (req, res) => {
  const { product_name, company } = req.body;
  try {
    const item = await prisma.product.create({
      data: {
        product_name,
        company: {
          connect: {
            id: company,
          },
        },
      },
    });
    if (!item) {
      return next(new Error(`The facility has failed to create.`));
    }
    res.status(201).send({ status: "success", data: item });
  } catch (error) {
    res
      .status(500)
      .json({ error: "Internal Server Error", message: error.message });
  }
});
export const getProduct = getOne("product");
export const getAllProduct = getAll("product");
export const deleteProduct = deleteOne("product");
export const updateProduct = updateOne("product");
