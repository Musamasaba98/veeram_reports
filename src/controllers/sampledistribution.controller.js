import {
  createOne,
  deleteOne,
  getAll,
  getOne,
  updateOne,
} from "./factory.controller";

export const createSampleDistribution = createOne("sampledistribution");
export const getSampleDistribution = getOne("sampledistribution");
export const getAllSampleDistribution = getAll("sampledistribution");
export const deleteSampleDistribution = deleteOne("sampledistribution");
export const updateSampleDistribution = updateOne("sampledistribution");
