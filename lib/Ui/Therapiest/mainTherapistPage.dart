import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Api_Handling/connectionSetup.dart';
import 'myPatientsList.dart';
import 'test.dart';

// ignore: camel_case_types
class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.5, -0.5), radius: 1.2,

                //begin: Alignment.topRight,
                //end: Alignment.bottomLeft,
                //alignment: Alignment(-1.0, -1.0)
                colors: [
                  //Colors.white,
                  const Color(0xFF77D4D1).withOpacity(0.6),
                  Colors.white,
                ],
                // tileMode: TileMode.clamp,
                // stops: const [
                //   2,
                //   2,
                // ]),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                ),
                Container(
                  width: 320.0,
                  height: 75.0,
                  // margin: const EdgeInsets.all(15.0),
                  //padding: const EdgeInsets.all(3.0),

                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABCECC),
                      spreadRadius: 0.5,
                      blurRadius: 50,
                    )
                  ]),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: const Color(0xFFF9FAFC),
                      maximumSize: const Size(400, 137),
                      side: const BorderSide(
                          width: 3.0, color: Colors.transparent),
                    ),
                    // <-- OutlinedButton
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) =>  LoginPage() ),
                      // );
                    },
                    child: Row(
                      children: [
                        Text(
                          'My Profile',
                          style: GoogleFonts.playfairDisplay(
                            fontStyle: FontStyle.normal,
                            //textStyle: Theme.of(context).textTheme.bodySmall,
                            fontWeight: FontWeight.bold,
                            color: const Color(
                                0xFFFFAB17), //TextStyle(color: Colors.black),
                            fontSize: 27,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Image.asset(
                            'assets/icons/user.png',
                            scale: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 320.0,
                  height: 75.0,
                  // margin: const EdgeInsets.all(15.0),
                  //padding: const EdgeInsets.all(3.0),

                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABCECC),
                      spreadRadius: 0.5,
                      blurRadius: 50,
                    )
                  ]),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: const Color(0xFFF9FAFC),
                      maximumSize: const Size(400, 137),
                      side: const BorderSide(
                          width: 3.0, color: Colors.transparent),
                    ),
                    // <-- OutlinedButton
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  cardListView()),
                      );

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) =>  LoginPage() ),
                      // );
                    },
                    child: Row(
                      children: [
                        Text(
                          'My Patients',
                          style: GoogleFonts.playfairDisplay(
                            fontStyle: FontStyle.normal,
                            //textStyle: Theme.of(context).textTheme.bodySmall,
                            fontWeight: FontWeight.bold,
                            color: const Color(
                                0xFFFFAB17), //TextStyle(color: Colors.black),
                            fontSize: 27,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 82),
                          child: Image.asset(
                            'assets/icons/patient.png',
                            scale: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 320.0,
                  height: 75.0,
                  // margin: const EdgeInsets.all(15.0),
                  //padding: const EdgeInsets.all(3.0),

                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABCECC),
                      spreadRadius: 0.5,
                      blurRadius: 30,
                    )
                  ]),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: const Color(0xFFF9FAFC),
                      maximumSize: const Size(400, 137),
                      side: const BorderSide(
                          width: 3.0, color: Colors.transparent),
                    ),
                    // <-- OutlinedButton
                    onPressed: () async {
                        // print("Try");
                        // var data = await getData('patientInfoAll');
                        // print(data);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  cardListView()),
                        );



                    },
                    child: Row(
                      children: [
                        Text(
                          'Scheduling',
                          style: GoogleFonts.playfairDisplay(
                            fontStyle: FontStyle.normal,
                            //textStyle: Theme.of(context).textTheme.bodySmall,
                            fontWeight: FontWeight.bold,
                            color: const Color(
                                0xFFFFAB17), //TextStyle(color: Colors.black),
                            fontSize: 27,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Image.asset(
                            'assets/icons/calendar.png',
                            scale: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
