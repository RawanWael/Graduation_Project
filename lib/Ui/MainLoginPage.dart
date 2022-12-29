import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Therapiest/mainTherapistPage.dart';


class MainLoginScreen extends StatefulWidget {
  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  LoginState createState() {
    return LoginState();
  }
}


class LoginState extends State<MainLoginScreen> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
   home: Scaffold(
     resizeToAvoidBottomInset: false,

     body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height ,
          //: Colors.black,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center:const Alignment(0.5, -0.5), radius: 1.2,

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
          child: Center(
            child: Column(

              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text(
                    'Let\'s Start!',
                    style: GoogleFonts.playfairDisplay(
                      fontStyle: FontStyle.normal,
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF273238),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 140),
                  child: Text(
                    'It\'s only to takes a few minutes',
                    style: GoogleFonts.playfairDisplay(
                      fontStyle: FontStyle.normal,
                      //textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFF273238),
                      fontSize: 18,
                    ),
                  ),
                ),

                //width: 179.0,
                // height: 137.0,
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  //child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // width: 179.0,
                    // height: 137.0,
                    children: [
                      Container(
                        width: 200.0,
                        height: 140.0,
                        // margin: const EdgeInsets.all(15.0),
                        //padding: const EdgeInsets.all(3.0),

                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xFFABCECC),
                            spreadRadius: 0.5,
                            blurRadius: 50,
                          )
                        ]),
                        child: OutlinedButton.icon(
                          //  child: OutlinedButton.icon(

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
                              MaterialPageRoute(builder: (context) =>  LoginPage() ),
                            );
                          },

                          icon: Image.asset(
                            'assets/icons/doctor.png',
                            scale: 10,
                          ),
                          label: Text(
                            'Add new Therapist',
                            style: GoogleFonts.playfairDisplay(
                              fontStyle: FontStyle.normal,
                              //textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .black, //TextStyle(color: Colors.black),
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      // Spacer(flex: 1,), // 1st spacer
                      Column(
                        children: [
                          Container(
                            width: 200.0,
                            height: 140.0,
                            // margin: const EdgeInsets.all(15.0),
                            //padding: const EdgeInsets.all(3.0),

                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Color(0xFFABCECC),
                                spreadRadius: 0.5,
                                blurRadius: 50,
                              )
                            ]),
                            child: OutlinedButton.icon(
                              //  child: OutlinedButton.icon(

                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                backgroundColor: const Color(0xFFF9FAFC),
                                side: const BorderSide(
                                    width: 3.0, color: Colors.transparent),
                              ),
                              // <-- OutlinedButton
                              onPressed: () {},

                              icon: Image.asset(
                                'assets/icons/medical.png',
                                scale: 10,
                              ),
                              label: Text(
                                'Add new Patient',
                                style: GoogleFonts.playfairDisplay(

                                  fontStyle: FontStyle.normal,
                                  //textStyle: Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .black, //TextStyle(color: Colors.black),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Container(
                              width: 200.0,
                              height: 140.0,
                              // margin: const EdgeInsets.all(15.0),
                              //padding: const EdgeInsets.all(3.0),

                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFABCECC),
                                  spreadRadius: 0.5,
                                  blurRadius: 50,
                                )
                              ]),
                              child: OutlinedButton.icon(
                                //  child: OutlinedButton.icon(

                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor: const Color(0xFFF9FAFC),
                                  side: const BorderSide(
                                      width: 3.0, color: Colors.transparent),
                                ),
                                // <-- OutlinedButton
                                onPressed: () {
                                  // Add_Teacher();
                                  // models.AddTeacher()
                                  //@app.route("/teacher", require("./routes/teacherRoutes"));

                                },

                                icon: Image.asset(
                                  'assets/icons/clinic.png',
                                  scale: 10,
                                ),
                                label: Center(
                                  child: Text(
                                    'Manage Therapist',
                                    style: GoogleFonts.playfairDisplay(
                                      fontStyle: FontStyle.normal,
                                      //textStyle: Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.bold,

                                      color: Colors
                                          .black, //TextStyle(color: Colors.black),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Container(
                              width: 200.0,
                              height: 140.0,
                              // margin: const EdgeInsets.all(15.0),
                              //padding: const EdgeInsets.all(3.0),

                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFABCECC),
                                  spreadRadius: 0.5,
                                  blurRadius: 50,
                                )
                              ]),
                              child: OutlinedButton.icon(
                                //  child: OutlinedButton.icon(

                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor: const Color(0xFFF9FAFC),
                                  side: const BorderSide(
                                      width: 3.0, color: Colors.transparent),
                                ),
                                // <-- OutlinedButton
                                onPressed: () {
                                  // Add_Teacher();
                                  // models.AddTeacher()
                                  //@app.route("/teacher", require("./routes/teacherRoutes"));

                                },

                                icon: Image.asset(
                                  'assets/icons/clinic.png',
                                  scale: 10,
                                ),
                                label: Center(
                                  child: Text(
                                    'Manage Patient',
                                    style: GoogleFonts.playfairDisplay(
                                      fontStyle: FontStyle.normal,
                                      //textStyle: Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.bold,

                                      color: Colors
                                          .black, //TextStyle(color: Colors.black),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
   ),
    );
  }
}
