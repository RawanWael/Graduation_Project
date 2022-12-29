import 'dart:convert';
import 'dart:core';
import 'dart:core';

List<newExerciseToAddModel> userFromJson(String str) =>
    List<newExerciseToAddModel>.from(json.decode(str).map((x) => newExerciseToAddModel.fromJson(x)));
String userToJson(List<newExerciseToAddModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class newExerciseToAddModel {
  newExerciseToAddModel({
    this.id = "",
    this.description = "",
    this.estimatedTime = "",
    this.exerciseName = "",
    this.exerciseType ="",
    this.path = "",
    required this.equipment,

  });
  String id;
  String description;
  List<dynamic> equipment;
  String exerciseName;
  String estimatedTime;
  String exerciseType;
  String path;

  factory newExerciseToAddModel.fromJson(Map<String, dynamic> json) => newExerciseToAddModel(
    id: json["_id"],
    description: json["description"],
     equipment:  json["equipment"],
    exerciseType: json["exerciseType"],
    estimatedTime: json["estimatedTime"],
    exerciseName: json["exerciseName"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
     "equipment": equipment,
    "exerciseType": exerciseType,
    "estimatedTime": estimatedTime,
    "exerciseName": exerciseName,
    "path": path,
  };
}
