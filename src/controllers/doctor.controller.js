import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller";

export const createDoctor = createOne("doctor");
export const getDoctor = getOne("doctor");
export const getAllDoctor = getAll("doctor");
export const deleteDoctor = deleteOne("doctor");
export const updateDoctor = updateOne("doctor");
