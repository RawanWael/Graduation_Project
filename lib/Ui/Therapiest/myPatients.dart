import 'dart:convert';

List<myPatients> userFromJson(String str) =>
    List<myPatients>.from(json.decode(str).map((x) => myPatients.fromJson(x)));
String userToJson(List<myPatients> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class myPatients {
  myPatients(
      {this.id = "",
      this.name = "",
      this.phoneNumber = 0,
      this.gender = "",
      this.age = 0});
  String id;
  String name;
  int phoneNumber;
  String gender;
  int age;

  factory myPatients.fromJson(Map<String, dynamic> json) => myPatients(
      id: json["_id"],
      name: json["fullName"],
      phoneNumber: json["phoneNumber"],
      gender: json["gender"],
      age: json["age"]
      );
  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": name,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "age": age,
      };
}
