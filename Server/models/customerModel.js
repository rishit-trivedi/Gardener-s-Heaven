import mongoose from "mongoose";

const customerSchema = new mongoose.Schema({
  custName: {
    type: String,
    required: true,
  },
  phoneNo: {
    type: Number,
    default: 0,
  },
  emailId:{
    type:String,
    required:true
  },
  password:{
    type:String,
    required:true
  }
});

const Customer = mongoose.model("Customer", customerSchema);

export  default Customer