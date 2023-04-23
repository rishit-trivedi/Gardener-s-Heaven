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

// router.post('/signup',customerAuthController.signup)
// router.post('/login',customerAuthController.login)
// router.post('/profile',customerController.getProfile)
// router.get('/allCustomer',customerController.getAllDoc)



export default route