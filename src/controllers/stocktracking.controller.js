import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller";

export const createStockTracking = createOne("stocktracking");
export const getStockTracking = getOne("stocktracking");
export const getAllStockTracking = getAll("stocktracking");
export const deleteStockTracking = deleteOne("stocktracking");
export const updateStockTracking = updateOne("stocktracking");
