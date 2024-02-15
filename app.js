import express from "express";
import reportRouter from "./src/routes/report.route.js";
import companyRouter from "./src/routes/company.route.js";
import doctorRouter from "./src/routes/doctor.route.js";
import facilityRouter from "./src/routes/facility.route.js";
import pharmacyRouter from "./src/routes/pharmacy.route.js";
import productRouter from "./src/routes/product.route.js";
import teamRouter from "./src/routes/team.route.js";
import morgan from "morgan";

const app = express();

app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("/api/report", reportRouter);
app.use("/api/company", companyRouter);
app.use("/api/doctor", doctorRouter);
app.use("/api/facility", facilityRouter);
app.use("/api/pharmacy", pharmacyRouter);
app.use("/api/product", productRouter);
app.use("/api/team", teamRouter);

export default app;
