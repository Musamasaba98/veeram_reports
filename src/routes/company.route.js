import express from "express";
import {
  createCompany,
  deleteCompany,
  getAllCompany,
  getCompany,
  updateCompany,
} from "../controllers/company.controller.js";

const router = express.Router();

router.route("/").post(createCompany);
router.route("/").get(getAllCompany);
router.route("/:id").get(getCompany);
router.route("/:id").put(updateCompany);
router.route("/:id").delete(deleteCompany);

export default router;
