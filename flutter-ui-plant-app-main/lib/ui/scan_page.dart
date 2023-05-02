//import 'dart:html';

import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Profile(),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       counter = counter + 1;
      //     });
      //   },
      //   child: Container(
      //     width: 60,
      //     height: 60,
      //     child: Icon(
      //       Icons.add
      //     ),
      //     decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         gradient: LinearGradient(
      //           colors: [Color.fromARGB(255, 69, 39, 160),Colors.deepPurpleAccent],)),
      //   ),
      // ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:5,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 128, 206, 106),Color.fromARGB(255, 127, 210, 122)],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 110.0,),
                      CircleAvatar(
                        radius: 65.0,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: 25.0,),
                      Text('Trupti Shriyan',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 20.0,
                      )),
                      SizedBox(height: 10.0,),
                      Text('',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 15.0,
                      ),)
                  ]
                  ),
                ),
              ),

              Expanded(
                flex:5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child:Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                        child: Container(
                          width: 310.0,
                          height:180.0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Information",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w800,
                                ),),
                                Divider(color: Colors.grey[300],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Colors.blueAccent[400],
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Email Id :",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("Trupti.shriyan@gmail.com",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color.fromARGB(255, 141, 139, 139)                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: 20.0,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Color.fromARGB(255, 60, 226, 221),
                                      size: 35,
                                    ),
                                    SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Phone Number : ",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),),
                                        Text("9820851484",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color.fromARGB(255, 141, 139, 139),
                                          ),)
                                      ],
                                    )

                                  ],
                                ),
                                // SizedBox(height: 20.0,),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Icon(
                                //       Icons.favorite,
                                //       color: Colors.pinkAccent[400],
                                //       size: 35,
                                //     ),
                                //     SizedBox(width: 20.0,),
                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Text("Loves",
                                //           style: TextStyle(
                                //             fontSize: 15.0,
                                //           ),),
                                //         Text("Eating cakes",
                                //           style: TextStyle(
                                //             fontSize: 12.0,
                                //             color: Colors.grey[400],
                                //           ),)
                                //       ],
                                //     )

                                //   ],
                                // ),
                                // SizedBox(height: 20.0,),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Icon(
                                //       Icons.people,
                                //       color: Colors.lightGreen[400],
                                //       size: 35,
                                //     ),
                                //     SizedBox(width: 20.0,),
                                //     Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         Text("Team",
                                //           style: TextStyle(
                                //             fontSize: 15.0,
                                //           ),),
                                //         Text("Team Natsu",
                                //           style: TextStyle(
                                //             fontSize: 12.0,
                                //             color: Colors.grey[400],
                                //           ),)
                                //       ],
                                //     )

                                //   ],
                                // ),
                              ],
                            ),
                          )
                        )
                      )
                    ),
                  ),
              ),

            ],
          ),
        //   Positioned(
        //       top:MediaQuery.of(context).size.height*0.45,
        //       left: 20.0,
        //       right: 20.0,
        //       child: Card(
        //         child: Padding(
        //           padding:EdgeInsets.all(16.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               Container(
        //                 child:Column(
        //                   children: [
        //                     Text('Battles',
        //                     style: TextStyle(
        //                       color: Colors.grey[400],
        //                       fontSize: 14.0
        //                     ),),
        //                     SizedBox(height: 5.0,),
        //                     Text("$counter",
        //                     style: TextStyle(
        //                       fontSize: 15.0,
        //                     ),)
        //                   ],
        //                 )
        //               ),

        //               Container(
        //                 child: Column(
        //                 children: [
        //                   Text('Birthday',
        //                     style: TextStyle(
        //                         color: Colors.grey[400],
        //                         fontSize: 14.0
        //                     ),),
        //                   SizedBox(height: 5.0,),
        //                   Text('April 7th',
        //                     style: TextStyle(
        //                       fontSize: 15.0,
        //                     ),)
        //                 ]),
        //               ),

        //               Container(
        //                   child:Column(
        //                     children: [
        //                       Text('Age',
        //                         style: TextStyle(
        //                             color: Colors.grey[400],
        //                             fontSize: 14.0
        //                         ),),
        //                       SizedBox(height: 5.0,),
        //                       Text('19 yrs',
        //                         style: TextStyle(
        //                           fontSize: 15.0,
        //                         ),)
        //                     ],
        //                   )
        //               ),
        //             ],
        //           ),
        //         )
        //       )
        //   )
        ],

      ),
    );
  }
}


