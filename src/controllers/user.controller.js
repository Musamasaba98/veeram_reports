import prisma from "../config/prisma.config.js";
import exclude from "../utils/prisma.exclude.js";
import asyncHandler from "express-async-handler";
import bcrypt from "bcrypt";

export const signup = asyncHandler(async (req, res, next) => {
  const {
    username,
    firstname,
    lastname,
    password,
    email,
    role,
    contact,
    gender,
    companyId,
    teamId,
  } = req.body;
  try {
    const existingUser = await prisma.user.findFirst({
      where: {
        OR: [{ username: username }, { email: email }],
      },
    });

    if (existingUser) {
      return res
        .status(400)
        .json({ success: false, error: "Username or email already exists" });
    }
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await prisma.user.create({
      data: {
        username,
        firstname,
        lastname,
        email,
        role,
        contact,
        gender,
        password: hashedPassword,
        // company: { connect: { id: companyId } },
        // team: { connect: { id: teamId } },
      },
    });
    const userWithoutPassword = exclude(newUser, ["password"]);
    res.status(201).json({ success: true, data: userWithoutPassword });
  } catch (error) {
    res
      .status(500)
      .json({ error: "Internal Server Error", message: error.message });
  }
});
