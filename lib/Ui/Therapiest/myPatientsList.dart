import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexcolor/hexcolor.dart';
import 'myPatients.dart';
import 'performsCardList.dart';
import 'Performs.dart';
import '../../Api_Handling/connectionSetup.dart';

class cardListView extends StatefulWidget {
  const cardListView({Key? key}) : super(key: key);

  @override
  State<cardListView> createState() => _cardListViewState();
}

class _cardListViewState extends State<cardListView> {
  // late Future<List<dynamic>> data;
  var data;

  List<myPatients> cardsData = [];

  @override
  void initState() {
    super.initState();

    data = getData('patientInfoAll');

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<dynamic> body = jsonDecode(snapshot.data);

          cardsData = body
              .map(
                (dynamic item) => myPatients.fromJson(item),
              )
              .toList();
          // print(object)
          for (int i = 0; i < cardsData.length; i++) {
            print(cardsData[i].name);
          }

          // Data fetched successfully, display your data here
          print(snapshot.data);
        }

        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: SafeArea(
                child: NewGradientAppBar(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // centerTitle: true, // add this line
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Card Example',
                      style: GoogleFonts.playfairDisplay(
                        fontStyle: FontStyle.normal,
                        // textStyle: Theme.of(context).textTheme.titleMedium,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                        // fontWeight: FontWeight.,
                        color: const Color(0xFF273238),
                      ),
                    ),
                  ),
                  gradient: LinearGradient(
                      colors: [HexColor('#006d77'), HexColor('#75D4D0')]),
                ),
              ),
            ),

            body: Container(
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
              child: ListView.builder(
                itemCount: cardsData.length,
                shrinkWrap: false,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Card(
                    shadowColor: HexColor("#93EEEA"),
                    elevation: 10,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: HexColor('#F9FAFC')),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100.0,
                                height: 55.0,
                                // color: Colors.green,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.transparent,
                                  child: Image.asset(
                                    'assets/icons/user.png',
                                    scale: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 10, 0),
                                      child: RichText(
                                        text: TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: GoogleFonts.playfairDisplay(
                                            fontStyle: FontStyle.normal,
                                            // textStyle: Theme.of(context).textTheme.,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFFFFB12A),
                                          ),

                                          children: <TextSpan>[
                                            const TextSpan(
                                                text: 'Name: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w800)),
                                            TextSpan(
                                                text: cardsData[index].name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 0, 0),
                                        child: RichText(
                                          text: TextSpan(
                                            // Note: Styles for TextSpans must be explicitly defined.
                                            // Child text spans will inherit styles from parent
                                            style: GoogleFonts.playfairDisplay(
                                              fontStyle: FontStyle.normal,
                                              // textStyle: Theme.of(context).textTheme.,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFB12A),
                                            ),

                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: 'ID: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800)),
                                              TextSpan(
                                                  text: cardsData[index].id,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 15, 15, 0),
                                        child: RichText(
                                          text: TextSpan(
                                            // Note: Styles for TextSpans must be explicitly defined.
                                            // Child text spans will inherit styles from parent
                                            style: GoogleFonts.playfairDisplay(
                                              fontStyle: FontStyle.normal,
                                              // textStyle: Theme.of(context).textTheme.,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFB12A),
                                            ),

                                            children: <TextSpan>[
                                              const TextSpan(
                                                  text: 'Gender: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800)),
                                              TextSpan(
                                                  text: cardsData[index].gender,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.black)),
                                            ],
                                          ),
                                        )),

                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 100, 0, 0),
                                      child: Center(
                                        child: IconButton(
                                          icon: Image.asset(
                                              'assets/icons/tasks.png',
                                              scale: 4),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) =>   performsCardList( cardsData[index].id.toString(), variable: '',), ),
                                            );
                                          },
                                        ),
                                      )),
                                ],
                              )
                            ],
                          ),

                          // Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
