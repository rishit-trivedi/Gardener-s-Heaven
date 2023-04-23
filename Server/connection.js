import mongoose from 'mongoose';

const connectDB  = async (DATABASE_URL)=>{
    try {
        const DB_OPTIONS={
            dbName: 'plantApp',
        }
        mongoose.set('strictQuery', false);
        const result = await mongoose.connect(DATABASE_URL,DB_OPTIONS);
        console.log(result)
        console.log("Connected succesfully");
    } catch (error) {
        console.log(error) 
    }
} 

export default connectDB