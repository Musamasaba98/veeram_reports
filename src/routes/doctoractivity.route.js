import express from "express";
import {
  createDoctorActivity,
  //   deleteDoctorActivity,
  //   getAllDoctorActivity,
  //   getDoctorActivity,
  //   updateDoctorActivity,
} from "../controllers/doctoractivity.controller.js";

const router = express.Router();

router.route("/add-doctor-activity").post(createDoctorActivity);
// router.route("/").get(getAllDoctorActivity);
// router.route("/:id").get(getDoctorActivity);
// router.route("/:id").put(updateDoctorActivity);
// router.route("/:id").delete(deleteDoctorActivity);

export default router;
