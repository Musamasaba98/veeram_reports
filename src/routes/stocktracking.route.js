import express from "express";
import {
  createStockTracking,
  deleteStockTracking,
  getAllStockTracking,
  getStockTracking,
  updateStockTracking,
} from "../controllers/stocktracking.controller.js";

const router = express.Router();

router.route("/").post(createStockTracking);
router.route("/").get(getAllStockTracking);
router.route("/:id").get(getStockTracking);
router.route("/:id").put(updateStockTracking);
router.route("/:id").delete(deleteStockTracking);

export default router;
