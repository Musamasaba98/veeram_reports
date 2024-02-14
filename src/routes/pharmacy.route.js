import express from "express";
import {
  createPharmacy,
  deletePharmacy,
  getAllPharmacy,
  getPharmacy,
  updatePharmacy,
} from "../controllers/pharmacy.controller.js";

const router = express.Router();

router.route("/").post(createPharmacy);
router.route("/").get(getAllPharmacy);
router.route("/:id").get(getPharmacy);
router.route("/:id").put(updatePharmacy);
router.route("/:id").delete(deletePharmacy);

export default router;
