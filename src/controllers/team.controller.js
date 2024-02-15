import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller.js";

export const createTeam = createOne("team");
export const getTeam = getOne("team");
export const getAllTeam = getAll("team");
export const deleteTeam = deleteOne("team");
export const updateTeam = updateOne("team");
