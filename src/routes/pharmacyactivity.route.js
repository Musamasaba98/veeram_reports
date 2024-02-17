import express from "express";
import {
  createPharmacyActivity,
  //   deletePharmacyActivity,
  //   getAllPharmacyActivity,
  //   getPharmacyActivity,
  //   updatePharmacyActivity,
} from "../controllers/pharmacyactivity.controller.js";

const router = express.Router();

router.route("/add-pharmacy-activity").post(createPharmacyActivity);
// router.route("/").get(getAllPharmacyActivity);
// router.route("/:id").get(getPharmacyActivity);
// router.route("/:id").put(updatePharmacyActivity);
// router.route("/:id").delete(deletePharmacyActivity);

export default router;
