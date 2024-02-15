import express from "express";
import {
  createTeam,
  deleteTeam,
  getAllTeam,
  getTeam,
  updateTeam,
} from "../controllers/team.controller.js";

const router = express.Router();

router.route("/").post(createTeam);
router.route("/").get(getAllTeam);
router.route("/:id").get(getTeam);
router.route("/:id").put(updateTeam);
router.route("/:id").delete(deleteTeam);

export default router;
