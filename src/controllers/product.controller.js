import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller";

export const createProduct = createOne("product");
export const getProduct = getOne("product");
export const getAllProduct = getAll("product");
export const deleteProduct = deleteOne("product");
export const updateProduct = updateOne("product");
