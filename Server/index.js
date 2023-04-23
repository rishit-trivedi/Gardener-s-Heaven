import  express from "express";
import connectDB from "./connection.js";
import customer from "../Server/routes/customer.js"
const app = express()
const port = 8000
const DATABASE_URl = "mongodb+srv://trivedirishit:rt30122002@cluster0.4fgmfcm.mongodb.net/?retryWrites=true&w=majority"


app.use(express.json())
connectDB(DATABASE_URl)


app.use("/api",customer);

app.listen(port,()=>{
    console.log(`Server listening at port http://localhost:${port}`) 
})