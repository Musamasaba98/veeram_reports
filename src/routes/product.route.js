import express from "express";
import {
  createProduct,
  deleteProduct,
  getAllProduct,
  getProduct,
  updateProduct,
} from "../controllers/product.controller.js";

const router = express.Router();

router.route("/").post(createProduct);
router.route("/").get(getAllProduct);
router.route("/:id").get(getProduct);
router.route("/:id").put(updateProduct);
router.route("/:id").delete(deleteProduct);

export default router;
