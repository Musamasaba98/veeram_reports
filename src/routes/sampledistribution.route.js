import express from "express";
import {
  createSampleDistribution,
  deleteSampleDistribution,
  getAllSampleDistribution,
  getSampleDistribution,
  updateSampleDistribution,
} from "../controllers/sampledistribution.controller.js";

const router = express.Router();

router.route("/").post(createSampleDistribution);
router.route("/").get(getAllSampleDistribution);
router.route("/:id").get(getSampleDistribution);
router.route("/:id").put(updateSampleDistribution);
router.route("/:id").delete(deleteSampleDistribution);

export default router;
