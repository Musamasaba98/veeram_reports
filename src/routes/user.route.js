import express from "express";
import {
  //   deleteUser,
  //   getAllUser,
  //   getUser,
  signup,
  //   updateUser,
} from "../controllers/user.controller.js";

const router = express.Router();

router.route("/addUser").post(signup);
// router.route("/").get(getAllUser);
// router.route("/:id").get(getUser);
// router.route("/:id").put(updateUser);
// router.route("/:id").delete(deleteUser);

export default router;
