import express  from"express";
import mongoose  from "mongoose";
import route from "./routes/customer.js";
// const Router = require("./routes")

const app = express();

app.use(express.json());
app.use(route)
const port = 8000
// const DATABASE_URl = "mongodb+srv://trivedirishit:rt30122002@cluster0.4fgmfcm.mongodb.net/?retryWrites=true&w=majority"
const DATABASE_URl = "mongodb+srv://trivedirishit:Rishit%40123@cluster0.ncvgts0.mongodb.net/?retryWrites=true&w=majority"
// const DATABASE_URl = "mongodb+srv://zakespy:Exodus%40123@cluster0.sdjc83s.mongodb.net/plantApp?retryWrites=true&w=majority"


mongoose.connect(DATABASE_URl);

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error: "));
db.once("open", function () {
  console.log("Connected successfully");
});

app.listen(port,()=>{
    console.log(`Server listening at port http://localhost:${port}`) 
})