import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AddNewTherapist extends StatefulWidget {
  const AddNewTherapist({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<AddNewTherapist> {
  Text getText(List val) {
    print("----------------------->");
    print(val);
    if (val.contains('Male') == 'Male' || val.contains('Female') ) {
      return const Text(
        'Gender',
        style: TextStyle(fontSize: 14),
      );
    } else {
      return  const Text(
        'Speciality',
        style: TextStyle(fontSize: 14),
      );
    }
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget DropdownButton(List item, String? value) => DropdownButtonFormField2(
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,

        hint:  getText(item),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: item
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null && item == "genderItems") {
            return 'Please select gender.';
          } else if (value == null && item == "specialityItems") {
            return 'Please select Speciality.';
          }
        },
        onChanged: (value) {
          //Do something when changing the item if you want.
        },
        onSaved: (value) {
          value = value.toString();
        },
      );

  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? selectedGenderValue;

  final List<String> specialityItems = [
    'Knee',
    'Shoulder',
  ];
  String? selectedSpecialityValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter TextField Example'),

            ),
            body: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Enter Username',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name',
                          hintText: 'Enter Full Name',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                          hintText: 'Enter Phone Number',
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(
                                          genderItems, selectedGenderValue)),
                                ),
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton(specialityItems,
                                          selectedSpecialityValue)),
                                ),
                              ],
                            ),
                          ],
                        )),
                    ElevatedButton(
                      // color: Colors.blue,
                      child: Text('Sign In'),
                      onPressed: () {},
                    )
                  ],
                ))));
  }
}
