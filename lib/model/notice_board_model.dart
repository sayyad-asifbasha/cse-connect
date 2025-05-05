import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeBoardModel {
  late String name;
  late String designation;
  late String message;
  late DateTime time;

  NoticeBoardModel({
    required this.name,
    required this.designation,
    required this.time,
    required this.message
  });

  factory NoticeBoardModel.fromJson(Map<String, dynamic> json) {
    return NoticeBoardModel(
      message: json['message'],
      time:  (json['time'] as Timestamp).toDate(),
      designation: json['designation'],
      name: json['name'],
    );
  }

  // Method for serialization to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time': time,
      'message': message,
      'designation': designation,
    };
  }
}