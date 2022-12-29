import 'dart:convert';
import 'dart:core';

List<therapistModel> userFromJson(String str) =>
    List<therapistModel>.from(json.decode(str).map((x) => therapistModel.fromJson(x)));
String userToJson(List<therapistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class therapistModel {
  therapistModel({
    this.id = "",
    this.password = "",
    this.clinicId = "",
    this.fullName = "",
    this.age = 0,
    this.gender = "",
    this.phoneNumber= 0 ,
    this.speciality ="",
    required this.patientId,

  });
  String id;
  String password;
  List<dynamic> patientId;
  String clinicId;
  String fullName;
  int age;
  String gender;
  int phoneNumber;
  String speciality;

  factory therapistModel.fromJson(Map<String, dynamic> json) => therapistModel(
    id: json["_id"],
    password: json["password"],
    patientId:  json["patientId"],
    clinicId: json["clinicId"],
    fullName: json["fullName"],
    age: json["age"],
    gender: json["gender"],
    phoneNumber: json["phoneNumber"],
    speciality: json["speciality"],
  );



  Map<String, dynamic> toJson() => {
    "id": id,
    "password": password,
    "patientId": patientId,
    "clinicId": clinicId,
    "fullName": fullName,
    "age": age,
    "gender": gender,
    "phoneNumber": phoneNumber,
    "speciality": speciality,
  };
}
