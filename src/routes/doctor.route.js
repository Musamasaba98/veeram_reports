import express from "express";
import {
  createDoctor,
  deleteDoctor,
  getAllDoctor,
  getDoctor,
  updateDoctor,
} from "../controllers/doctor.controller.js";

const router = express.Router();

router.route("/").post(createDoctor);
router.route("/").get(getAllDoctor);
router.route("/:id").get(getDoctor);
router.route("/:id").put(updateDoctor);
router.route("/:id").delete(deleteDoctor);

export default router;
