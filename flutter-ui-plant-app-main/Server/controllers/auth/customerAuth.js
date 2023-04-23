// import customerModel from "../../models/customerModel.js";
import customerModel from "../../models/customerModel.js";


class customerAuthController {

    static signup = async (req,res)=>{
        const {emailId,password,name,phoneNo} = req.body
        console.log(req.body)
        await customerModel.findOne({emailId:emailId}).then(async e=>{
            console.log(e)
            if(e){
                return res.json({message:"User already exist",status:false} )
            }else{
                // console.log(parseInt(process.env.SALT));
                // const salt = bcrypt.genSaltSync(parseInt(process.env.SALT));
                // console.log(salt)
                // console.log(password)
                // const hash = bcrypt.hashSync(password,salt)
                const newUser = new customerModel({emailId:emailId,password:password,name:name,phoneNo:phoneNo})
                await newUser.save().then(e=>{
                    return res.json({message:"successfully signup",status:true,profile:newUser})
                })
                console.log(newUser);
            }
        }).catch(err=>{
            console.log(err)
            // return res.status(500).json({message:"Server error",status:false})
        })
    }

  static login = async (req, res) => { 
    const {emailId,password} = req.body
    console.log(emailId,' ',password)
    await customerModel.findOne({emailId:emailId}).then(async e=>{
        if(e.password == password){
            return res.json({message:"Successfully login",status:true})
        }else{
            return res.json({message:"User does not exist",status:false})
        }
    }).catch(error=>{console.log(error)})
    // }).catch(error=>{return res.st atus(500).json({message:error,status:false})})
    
  };
}

export default customerAuthController;