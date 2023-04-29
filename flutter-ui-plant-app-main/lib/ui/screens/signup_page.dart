import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/custom_textfield.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map user = {
    'emailId': '',
    'password': '',
    'confirmPassword': '',
    'name': '',
    'phoneNo': '',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gardener's Heaven"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/signup.png'),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                  // backgroundColor: Colors.green,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.alternate_email),
                  hintText: 'Enter Email Id',
                ),
                onChanged: (value) => {
                  setState(() {
                    user['emailId'] = value;
                  })
                },
              ),
              TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter Full Name',
                ),
                onChanged: (value) => {
                  setState(() {
                    user['name'] = value;
                  })
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Enter Password',
                ),
                onChanged: (value) => {
                  setState(() {
                    user['password'] = value;
                  })
                },
              ),
              TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  icon: Icon(Icons.call),
                  hintText: 'Enter Phone No',
                ),
                onChanged: (value) => {
                  setState(() {
                    user['phoneNo'] = value;
                  })
                }
              ),
              const SizedBox(
                height: 10,
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, 'otp');
                          Navigator.pushNamed(context, 'signin_page');
                        },
                        child: Container(
                          // alignment: Alignment.bottomCenter,
                          height: 60,
                          width: 280,

                          // transformAlignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            // color:Colors.green.shade500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     width: size.width,
              //     decoration: BoxDecoration(
              //       // color: Constants.primaryColor,
              //       color:Colors.green.shade500,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //     child: const Center(
              //       child: Text(
              //         'Sign Up',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/google.png'),
                    ),
                    Text(
                      'Sign Up with Google',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Have an Account? ',
                        style: TextStyle(
                          color: Constants.blackColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
