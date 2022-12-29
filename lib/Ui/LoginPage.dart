import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:ptcvdl_v3/Api_Handling/connectionSetup.dart';
import 'package:ptcvdl_v3/Ui/AddNewTherapist.dart';
import 'package:ptcvdl_v3/Ui/MainLoginPage.dart';
import 'package:ptcvdl_v3/Ui/Therapiest/performsCardList.dart';
import 'Therapiest/mainTherapistPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({Key? key}) : super(key: key);
  static TextEditingController userName = TextEditingController();
   static TextEditingController password = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  savePref(String username) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("username", username);
    print('save Pref');
    print(getPref());
  }
  getPref() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var username = preferences.getString("username");
    print(username);
    // if(username != null){
    //   Navigator.of(context).pushNamed('MainLoginPage');
    // }
  }

  bool checkValidation(String email, String password) {
    if (email.isEmpty) {
      return false;
    }
    if (password.isEmpty) {
      return false;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {

    var isValid = true;
     late TextEditingController userName = TextEditingController();
    late TextEditingController password = TextEditingController();

    String Email = "";

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.5, -0.5),
                  radius: 1.2,
                  colors: [
                    //Colors.white,
                    const Color(0xFF77D4D1).withOpacity(0.6),
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  //padding: const EdgeInsets.only(left: 35, top: 80),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 50, top: 90),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Let's sign you in.",
                        style: GoogleFonts.playfairDisplay(
                          fontStyle: FontStyle.normal,
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF273238),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 50, top: 1),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Welcome Back,",
                        style: GoogleFonts.playfairDisplay(
                          fontStyle: FontStyle.normal,
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF273238),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: SizedBox(
                            width: 400,
                            height: 60.0,
                            // margin: const EdgeInsets.all(15.0),
                            //padding: const EdgeInsets.all(3.0),

                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  // // shadowColor: Color(0XFF000000)
                                  // color: Color(0xFFABCECC),
                                  // // spreadRadius: 0.5,
                                  // // blurRadius: 15,
                                  color: const Color(0xFF75D4D0).withOpacity(0.9),
                                  spreadRadius: 3,
                                  blurRadius: 20,
                                  offset: const Offset(0, 2),
                                )
                              ]),
                              child: TextFormField(
                                controller: userName,
                                style: GoogleFonts.playfairDisplay(
                                  fontStyle: FontStyle.normal,
                                  //textStyle: Theme.of(context).textTheme.bodySmall,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(
                                      0xFF273238), //TextStyle(color: Colors.black),
                                  fontSize: 20,
                                ),
                                maxLines: 1,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFFFAB17), width: 1.0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFBFEAE9),
                                  prefixIcon: const Icon(Icons.email,
                                      color: Colors.orange),
                                  enabledBorder: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    //borderSide: BorderSide(color: Colors.red),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF273238), width: 1.0),

                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: "Username",
                                  labelStyle: GoogleFonts.playfairDisplay(
                                    fontStyle: FontStyle.normal,
                                    //textStyle: Theme.of(context).textTheme.bodySmall,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(
                                        0xFF4C5E5D), //TextStyle(color: Colors.black),
                                    fontSize: 16,
                                  ),
                                  floatingLabelStyle: const TextStyle(
                                      color: Color(0xFF4C5E5D),
                                      backgroundColor: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF75D4D0).withOpacity(0.9),
                                spreadRadius: 2,
                                blurRadius: 15,
                                offset: const Offset(2, 2),
                              )
                            ]),
                            child: SizedBox(
                              width: 400,
                              height: 60.0,
                              child: TextFormField(
                                controller: password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFFFAB17), width: 1.0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFBFEAE9),
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Colors.orange),
                                  enabledBorder: OutlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    //borderSide: BorderSide(color: Colors.red),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF273238), width: 1.0),

                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: "Password",
                                  labelStyle: GoogleFonts.playfairDisplay(
                                    fontStyle: FontStyle.normal,
                                    //textStyle: Theme.of(context).textTheme.bodySmall,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(
                                        0xFF4C5E5D), //TextStyle(color: Colors.black),
                                    fontSize: 16,
                                  ),
                                  // labelStyle: const TextStyle(
                                  //
                                  //     fontFamily: 'PlayfairDisplay'),
                                  floatingLabelStyle: const TextStyle(
                                      color: Color(0xFF4C5E5D),
                                      backgroundColor: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 280),
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      // margin: const EdgeInsets.all(15.0),
                      //padding: const EdgeInsets.all(3.0),

                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xFFABCECC),
                          spreadRadius: 0.2,
                          blurRadius: 20,
                        )
                      ]),
                      child: OutlinedButton(
                          //  child: OutlinedButton.icon(

                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: const Color(0xFF75D4D0),
                            maximumSize: const Size(400, 137),
                            side: const BorderSide(
                                width: 1.0, color: Color(0xFFBFEAE9)),
                          ),
                          // <-- OutlinedButton
                          onPressed: () async {


                            // Function to check validation of user name and pass
                            final body = {
                              'username': userName.text,
                              'password': password.text,
                            };
                            savePref(userName.text);
                            //getPref();

                            //Email = userName.text;
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>  mainPage() ),
                            );
                            // var data = await postData('login', body);

                            // print(data);


                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.playfairDisplay(
                              fontStyle: FontStyle.normal,
                              //textStyle: Theme.of(context).textTheme.bodySmall,
                              fontWeight: FontWeight.bold,
                              color: const Color(
                                  0xFF273238), //TextStyle(color: Colors.black),
                              fontSize: 24,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
