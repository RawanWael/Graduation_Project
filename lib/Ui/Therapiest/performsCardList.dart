import 'dart:convert';

import 'package:flutter/physics.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Performs.dart';
import 'myPatientsList.dart';
import 'myPatients.dart';
import 'newExerciseToAddModel.dart';
import 'therapistModel.dart';
import '../../Api_Handling/connectionSetup.dart';

class performsCardList extends StatefulWidget {
  final String myArgument;

  performsCardList(this.myArgument, {required String variable});
  // const performs, required variableCardList({Key? key, required variable}) : super(key: key);

  @override
  State<performsCardList> createState() =>
      _performsCardListState(patientId: myArgument);
}

class _performsCardListState extends State<performsCardList> {
  late String patientId = "";
  _performsCardListState({required this.patientId});
  Icon firstIcon = const Icon(
    Icons.check, // Icons.favorite
  );
  Icon secondIcon = const Icon(
    Icons.add,
  );

  // WE should get the data from the shared pref
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final username = preferences.getString("username") ?? '';
    return username;
  }

  var therapistId;
  var mappedTherapistData;
  var performsForPatientByTherapistData;
  var newExercisesToAddData;
  var therapistInfo;
  bool toggle = false;

  List<newExerciseToAddModel> cardsDataPost = [];
  List<therapistModel> therapistData = [];
  List<Performs> cardsData = [];
  List<bool> selected = <bool>[];
  List<TextEditingController> repetitionCountList = [];
  List<TextEditingController> numberOfDaysList = [];

  _getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      therapistId = (prefs.getString('username') ?? '');
    });
    performsForPatientByTherapistData = getData(
        'getPerformsForPatientByTherapist/$therapistId/$patientId'); // Therapist ID - Patient Id
    newExercisesToAddData =
        getData('viewNewExercisesToAdd/$therapistId/$patientId');
    therapistInfo = await getData('therapistInformation/$therapistId');
    List jsonResponse = json.decode(therapistInfo);
    mappedTherapistData =
        jsonResponse.map((data) => therapistModel.fromJson(data)).toList();

    print(mappedTherapistData[0].fullName);
    print("Therapist ID = $therapistId");
    print("Patient ID = $patientId");
  }

  @override
  void initState() {
    super.initState();
    _getId();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: performsForPatientByTherapistData,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<dynamic> body = jsonDecode(snapshot.data);
          cardsData = body
              .map(
                (dynamic item) => Performs.fromJson(item),
              )
              .toList();

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
            floatingActionButton: FloatingActionButton(
              backgroundColor: HexColor('#0E7981'),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      // <-- SEE HERE
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (BuildContext context) {
                      return SizedBox(
                        //width: MediaQuery
                        height: 600,
                        child: FutureBuilder(
                            future: newExercisesToAddData,
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                List<dynamic> body = jsonDecode(snapshot.data);
                                cardsDataPost = body
                                    .map(
                                      (dynamic item) =>
                                          newExerciseToAddModel.fromJson(item),
                                    )
                                    .toList();
                                for (int i = 0; i < cardsDataPost.length; i++) {
                                  selected.add(false);
                                }
                                repetitionCountList = List.generate(
                                    10, (i) => TextEditingController());
                                numberOfDaysList = List.generate(
                                    10, (i) => TextEditingController());
                              }
                              return Scaffold(
                                body: Container(
                                  width: 1000,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    gradient: RadialGradient(
                                      center: const Alignment(0.5, -0.5),
                                      radius: 1.2,
                                      colors: [
                                        //Colors.white,
                                        const Color(0xFF77D4D1)
                                            .withOpacity(0.6),
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                  child: ListView.builder(
                                      itemCount: cardsDataPost.length,
                                      shrinkWrap: false,
                                      itemBuilder: (BuildContext context,
                                              int index) =>

                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            child: Card(
                                              shadowColor: HexColor("#93EEEA"),
                                              elevation: 10,
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    color: HexColor('#F9FAFC')),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: SizedBox(
                                                            width: 300,
                                                            child: Column(
                                                              // mainAxisAlignment: MainAxisAlignment.end,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      RichText(
                                                                    // overflow:
                                                                    //     TextOverflow.ellipsis,
                                                                    maxLines: 1,
                                                                    text:
                                                                        TextSpan(
                                                                      // Note: Styles for TextSpans must be explicitly defined.
                                                                      // Child text spans will inherit styles from parent
                                                                      style: GoogleFonts
                                                                          .playfairDisplay(
                                                                        fontStyle:
                                                                            FontStyle.normal,

                                                                        // textStyle: Theme.of(context).textTheme.,
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: const Color(
                                                                            0xFFFFB12A),
                                                                      ),

                                                                      children: <
                                                                          TextSpan>[
                                                                        const TextSpan(
                                                                          text:
                                                                              'Exercise NameA: ',
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.w800),
                                                                        ),
                                                                        TextSpan(
                                                                            text: cardsDataPost[index]
                                                                                .exerciseName,
                                                                            style: const TextStyle(
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontWeight: FontWeight.w300,
                                                                                color: Colors.black)),
                                                                      ],
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            5,
                                                                            15,
                                                                            15,
                                                                            0),
                                                                    child:
                                                                        RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        // Note: Styles for TextSpans must be explicitly defined.
                                                                        // Child text spans will inherit styles from parent
                                                                        style: GoogleFonts
                                                                            .playfairDisplay(
                                                                          fontStyle:
                                                                              FontStyle.normal,
                                                                          // textStyle: Theme.of(context).textTheme.,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              const Color(0xFFFFB12A),
                                                                        ),

                                                                        children: <
                                                                            InlineSpan>[
                                                                          const TextSpan(
                                                                              text: 'Repetition Count: ',
                                                                              style: TextStyle(fontWeight: FontWeight.w800)),
                                                                          WidgetSpan(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              child: TextField(
                                                                                controller: repetitionCountList.isNotEmpty ? repetitionCountList[index] : null,
                                                                                // repetitionCountList[index],

                                                                                decoration: const InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(0),
                                                                                ),
                                                                                style: GoogleFonts.playfairDisplay(
                                                                                  fontStyle: FontStyle.normal,
                                                                                  //textStyle: Theme.of(context).textTheme.bodySmall,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Colors.black,
                                                                                  //TextStyle(color: Colors.black),
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                                Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            5,
                                                                            15,
                                                                            15,
                                                                            0),
                                                                    child:
                                                                        RichText(
                                                                      text:
                                                                          TextSpan(
                                                                        // Note: Styles for TextSpans must be explicitly defined.
                                                                        // Child text spans will inherit styles from parent
                                                                        style: GoogleFonts
                                                                            .playfairDisplay(
                                                                          fontStyle:
                                                                              FontStyle.normal,
                                                                          // textStyle: Theme.of(context).textTheme.,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color:
                                                                              const Color(0xFFFFB12A),
                                                                        ),

                                                                        children: <
                                                                            InlineSpan>[
                                                                          const TextSpan(
                                                                              text: 'Number of days: ',
                                                                              style: TextStyle(fontWeight: FontWeight.w800)),
                                                                          WidgetSpan(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              child: TextField(
                                                                                controller: numberOfDaysList.isNotEmpty ? numberOfDaysList.elementAt(index) : null,
                                                                                decoration: const InputDecoration(
                                                                                  isDense: true,
                                                                                  contentPadding: EdgeInsets.all(0),
                                                                                ),
                                                                                style: GoogleFonts.playfairDisplay(
                                                                                  fontStyle: FontStyle.normal,
                                                                                  //textStyle: Theme.of(context).textTheme.bodySmall,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Colors.black,
                                                                                  //TextStyle(color: Colors.black),
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    50,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                color: HexColor(
                                                                        '#0E7981')
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                              child: IconButton(
                                                                icon: selected
                                                                        .elementAt(
                                                                            index)
                                                                    ? firstIcon
                                                                    : secondIcon,

                                                                onPressed:
                                                                    () async {
                                                                  print(
                                                                      "Selected\n");
                                                                  print(index);
                                                                  print(selected
                                                                      .elementAt(
                                                                          index));
                                                                  print(
                                                                      "---------------");
                                                                  if (!selected[
                                                                      index]) {
                                                                    print(
                                                                        "Why are not you printing\n\n");
                                                                    Fluttertoast.showToast(
                                                                        msg:
                                                                            "The exercise has been successfully added",
                                                                        toastLength:
                                                                            Toast
                                                                                .LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity
                                                                                .BOTTOM,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        fontSize:
                                                                            16.0);
                                                                    print(
                                                                        'parse');
                                                                    print((repetitionCountList
                                                                        .elementAt(
                                                                            index)
                                                                        .text));
                                                                    final body3 =
                                                                        {
                                                                      "_id": 0,
                                                                      "patientId":
                                                                          patientId,
                                                                      "therapistId":
                                                                          therapistId,
                                                                      "therapistName":
                                                                          mappedTherapistData[0]
                                                                              .fullName,
                                                                      "exerciseType":
                                                                          cardsDataPost[index]
                                                                              .exerciseType,
                                                                      "exerciseName":
                                                                          cardsDataPost[index]
                                                                              .exerciseName,
                                                                      "repetitionCount": ((repetitionCountList
                                                                          .elementAt(
                                                                              index)
                                                                          .text)),
                                                                      "numberOfDays": ((numberOfDaysList
                                                                          .elementAt(
                                                                              index)
                                                                          .text))
                                                                    };
                                                                    var data = await postData(
                                                                        'addNewPerform',
                                                                        body3);


                                                                  }
                                                                  setState(() {
                                                                    selected[
                                                                            index] =
                                                                        !selected
                                                                            .elementAt(index);
                                                                    //Will send the post request here
                                                                  });
                                                                  print(
                                                                      'tap on ${index + 1}th IconButton ( change to : ');
                                                                  print(selected[
                                                                          index]
                                                                      ? 'active'
                                                                      : 'deactive' +
                                                                          ' )');
                                                                },
                                                              ),
                                                              //-------------------------------//
                                                            )),
                                                      ],
                                                    ),

                                                    // Container(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )),
                                ),
                              );
                            }),
                      );
                      //     height: 1200,
                      //     width: MediaQuery.of(context).size.width,
                      //
                    }).then((value) => {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => performsCardList(patientId, variable: '',)),
                  );
                }),
                });
                // Add your onPressed code here!
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
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
                                width: 50.0,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 300,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 15, 0, 0),
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            text: TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style:
                                                  GoogleFonts.playfairDisplay(
                                                fontStyle: FontStyle.normal,
                                                // textStyle: Theme.of(context).textTheme.,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFB12A),
                                              ),

                                              children: <TextSpan>[
                                                const TextSpan(
                                                    text: 'Exercise Name: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800)),
                                                TextSpan(
                                                    text: cardsData[index]
                                                        .exerciseName,
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 15, 15, 0),
                                          child: RichText(
                                            text: TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style:
                                                  GoogleFonts.playfairDisplay(
                                                fontStyle: FontStyle.normal,
                                                // textStyle: Theme.of(context).textTheme.,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFB12A),
                                              ),

                                              children: <TextSpan>[
                                                const TextSpan(
                                                    text: 'Repetition Count: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800)),
                                                TextSpan(
                                                    text: cardsData[index]
                                                        .repetitionCount
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 15, 15, 15),
                                          child: RichText(
                                            text: TextSpan(
                                              // Note: Styles for TextSpans must be explicitly defined.
                                              // Child text spans will inherit styles from parent
                                              style:
                                                  GoogleFonts.playfairDisplay(
                                                fontStyle: FontStyle.normal,
                                                // textStyle: Theme.of(context).textTheme.,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFB12A),
                                              ),

                                              children: <TextSpan>[
                                                const TextSpan(
                                                    text: 'Number of days: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800)),
                                                TextSpan(
                                                    text: cardsData[index]
                                                        .numberOfDays
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
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
                                          0, 100, 0, 0),
                                      child: Center(
                                        child: IconButton(
                                          icon: Image.asset(
                                              'assets/icons/tasks.png',
                                              scale: 4),
                                          onPressed: () {},
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
