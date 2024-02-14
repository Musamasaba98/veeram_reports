import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller.js";

export const createFacility = createOne("facility");
export const getFacility = getOne("facility");
export const getAllFacility = getAll("facility");
export const deleteFacility = deleteOne("facility");
export const updateFacility = updateOne("facility");
