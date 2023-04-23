import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';
// import 'package:pinput/pin_put/pin_put.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Phone Number Verfication'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(


            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                Center(child: Text("Verification has been sent to your phone number",
                  style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.w600),
                ),
                ),
                SizedBox(height: 100,),
                PinCodeTextField(

                  keyboardType: TextInputType.number,
                  inputFormatters: [

                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.black45,
                    selectedColor: Colors.green.shade100,
                    inactiveFillColor: Colors.transparent,
                    selectedFillColor: Colors.grey.shade100,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  errorAnimationController: StreamController(),
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  }, appContext: context,
                ),
                TextButton(onPressed: ()=>{
                  Navigator.pushNamed(context, 'signin_page')
                }, child: Text("Submit"))
              ],
            ),

          ),
        ),
      ),
    );
  }
}