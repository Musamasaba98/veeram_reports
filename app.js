import express from "express";
import reportRouter from "./src/routes/report.route.js";
import companyRouter from "./src/routes/company.route.js";
import doctorRouter from "./src/routes/doctor.route.js";
import facilityRouter from "./src/routes/facility.route.js";
import pharmacyRouter from "./src/routes/pharmacy.route.js";
import productRouter from "./src/routes/product.route.js";
import teamRouter from "./src/routes/team.route.js";
import sampleDistributionRouter from "./src/routes/sampledistribution.route.js";
import stockTrackingRouter from "./src/routes/stocktracking.route.js";
import userRouter from "./src/routes/user.route.js";
import pharmacyActivityRouter from "./src/routes/pharmacyactivity.route.js";
import doctorActivityRouter from "./src/routes/doctoractivity.route.js";
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
app.use("/api/sample", sampleDistributionRouter);
app.use("/api/stock", stockTrackingRouter);
app.use("/api/user", userRouter);
app.use("/api/field-pharmacy", pharmacyActivityRouter);
app.use("/api/field-doctor", doctorActivityRouter);

export default app;
