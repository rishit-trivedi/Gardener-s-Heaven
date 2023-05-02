import express from 'express'
// import customerController from "../controllers/customerController.js";
// import customerAuthController from "../controllers/auth/customerAuth.js";
import Customer from '../models/customerModel.js';
import { validatePaymentVerification } from "razorpay/dist/utils/razorpay-utils.js";
import Razorpay from "razorpay";

// const router = express.Router();
const route = express()


route.post("/add_cust", async (request, response) => {
    const cust = new Customer(request.body);
  
    try {
      await cust.save();
      response.send(cust);
    } catch (error) {
      response.status(500).send(error);
    }
});

route.get("/customers", async (request, response) => {
    const customers = await Customer.find({});
  
    try {
      response.send(customers);
    } catch (error) {
      response.status(500).send(error);
    }
  });

route.post("/getCust",async (request,response)=>{
  const {emailId} = req.body
  const cust = await Customer.findOne({emailId:emailId}).then(e=>{
    return res.json({cust:e,status:true})
  })
})

route.post("/signup",async (request,response)=>{
  const {emailId,password,custName,phoneNo} = request.body
  await Customer.findOne({emailId:emailId}).then(async e=>{
    if(e){
      return response.json({message:"Customer already exist",status:false})
    }else{
      const newCust = new Customer({emailId,password,custName,phoneNo})
      await newCust.save().then(e=>{return response.json({message:"Successfully added customer",status:true})})
    }
  })
})

route.post("/login",async (request,response)=>{
  const {emailId,password} = request.body
  await Customer.findOne({emailId:emailId,password:password}).then(async e=>{
    if(e){
      return response.json({message:"Successfully login",status:true})
    }else{
      return response.json({message:"Customer does not exist",status:false})
    }
  })
})

// router.post('/signup',customerAuthController.signup)
// router.post('/login',customerAuthController.login)
// router.post('/profile',customerController.getProfile)
// router.get('/allCustomer',customerController.getAllDoc)


export const createOrder = async (req, res) => {
  const { amount } = req.body;
  var instance = new Razorpay( { key_id: 'rzp_test_rk34q3MXaI4tBi', key_secret: 'T5RC8mNXy9yJANYD6QLdEUPH' } );
  var options = {
    amount: amount * 100,
    currency: "INR",
    receipt: "rcpt_id_1",
  };
  
  
  try {
    let order = await instance.orders.create(options);
    
    const newOrder = new orderModel({ isPaid: false, amount: amount, order_id: order.id, payment_id: "pay_id", signature: "T5RC8mNXy9yJANYD6QLdEUPH" });
    
    await newOrder.save();
    
    res.status(201).json( { success: true, order: order, newOrder: newOrder } );
  } catch (error) {
    res.status(500).json( { message: error.message } );
  }
  
};

export const verifySignature = async (req, res) => {
  const { order_id, razorpay_payment_id, razorpay_signature } = req.body;
  
  try {
    const generated_signature = validatePaymentVerification( { "order_id": order_id, "payment_id": razorpay_payment_id }, 
    razorpay_signature, "T5RC8mNXy9yJANYD6QLdEUPH" );
    
    if( generated_signature == true ) {
      res.status(200).json( { message: "Your payment was successfull" } );
      }
      else {
        res.status(200).json( { message: "Your payment failed" } );
        
      }
    } catch (error) {
      res.status(500).json( { message: error.message } );
    }
  };
  
  export const paymentSuccess = async (req, res) => {
    const { order_id } = req.body;
    
    try {
      const updatedOrder = await orderModel.findOneAndUpdate({ order_id: order_id }, { isPaid: true }, {new:true});
      
      res.status(200).json( {message: "Your payment was successfull", order: updatedOrder } );
    } catch (error) {
      res.status(500).json({message: error.message});
    }
  };
  
  
  
  route.post("/createOrder", createOrder);
  route.post("/verifySignature", verifySignature);
  route.post("/paymentSuccess", paymentSuccess);
  
  
  


  export default route