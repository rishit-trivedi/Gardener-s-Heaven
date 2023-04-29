import express from 'express'
// import customerController from "../controllers/customerController.js";
// import customerAuthController from "../controllers/auth/customerAuth.js";
import Customer from '../models/customerModel.js';

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



export default route