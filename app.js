import express from "express";
import reportRouter from "./src/routes/report.route.js";
import companyRouter from "./src/routes/company.route.js";
import doctorRouter from "./src/routes/doctor.route.js";
import morgan from "morgan";

const app = express();

app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/api/report", reportRouter);
app.use("/api/company", companyRouter);
app.use("/api/doctor", doctorRouter);

export default app;
