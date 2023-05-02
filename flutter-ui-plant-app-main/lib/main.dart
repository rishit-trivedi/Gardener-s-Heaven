

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/scan_page.dart';
import 'package:flutter_onboarding/ui/screens/opt.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';


import 'ui/onboarding_screen.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      routes: {
        'onboardin_screen': (context)=> OnboardingScreen(),
      'signin_page': (context)=> SignIn(),
      'root_page': (context)=> RootPage(),
        'otp': (context)=> HomePage(),
        'myprofile' :(context) => Profile()
  },
  )
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//
//       title: 'Garderner Heaven',
//       home: OnboardingScreen(),
//
//     );
//   }
// }
