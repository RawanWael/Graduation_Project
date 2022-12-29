import 'dart:convert';

List<Performs> userFromJson(String str) =>
    List<Performs>.from(json.decode(str).map((x) => Performs.fromJson(x)));
String userToJson(List<Performs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Performs {
  Performs({
    this.id = "",
    this.patientId = "",
    this.therapistId = "",
    this.therapistName = "",
    this.exerciseType = "",
    this.exerciseName = "",
    this.repetitionCount = "",
    this.numberOfDays = "",
  });
  String id;
  String patientId;
  String therapistId;
  String therapistName;
  String exerciseType;
  String exerciseName;
  String repetitionCount;
  String numberOfDays;

  factory Performs.fromJson(Map<String, dynamic> json) => Performs(
        id: json["_id"],
        patientId: json["patientId"],
        therapistId: json["therapistId"],
        therapistName: json["therapistName"],
        exerciseType: json["exerciseType"],
        exerciseName: json["exerciseName"],
        repetitionCount: json["repetitionCount"],
        numberOfDays: json["numberOfDays"],

        // title: json["title"],
        // completed: json["completed"],
      );
  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "repetitionCount": repetitionCount,
        "numberOfDays": numberOfDays,
        "id": id,
        "patientId": patientId,
        "therapistId": therapistId,
        "therapistName": therapistName,
        "exerciseType": exerciseType,
      };
}
