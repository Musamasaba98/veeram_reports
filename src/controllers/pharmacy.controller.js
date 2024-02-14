import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller.js";

export const createPharmacy = createOne("pharmacy");
export const getPharmacy = getOne("pharmacy");
export const getAllPharmacy = getAll("pharmacy");
export const deletePharmacy = deleteOne("pharmacy");
export const updatePharmacy = updateOne("pharmacy");
