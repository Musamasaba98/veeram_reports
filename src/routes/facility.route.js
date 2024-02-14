import express from "express";
import {
  createFacility,
  deleteFacility,
  getAllFacility,
  getFacility,
  updateFacility,
} from "../controllers/facility.controller.js";

const router = express.Router();

router.route("/").post(createFacility);
router.route("/").get(getAllFacility);
router.route("/:id").get(getFacility);
router.route("/:id").put(updateFacility);
router.route("/:id").delete(deleteFacility);

export default router;
