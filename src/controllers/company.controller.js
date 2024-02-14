import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller.js";

export const createCompany = createOne("company");
export const getCompany = getOne("company");
export const getAllCompany = getAll("company");
export const deleteCompany = deleteOne("company");
export const updateCompany = updateOne("company");
