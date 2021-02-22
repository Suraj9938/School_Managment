import 'package:flutter/cupertino.dart';

class Routine {
  static String table = "routine";
  
  final String routineId;
  final String routineDate;
  final String routineSubject;
  final String subjectStartTime;
  final String subjectEndTime;
  final String subjectTeacher;

  Routine({
    @required this.routineId,
    @required this.routineDate,
    @required this.routineSubject,
    @required this.subjectStartTime,
    @required this.subjectEndTime,
    @required this.subjectTeacher,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'routineId' : routineId,
      'routineDay' : routineDate,
      'routineSubject' : routineSubject,
      'subjectStartTime' : subjectStartTime,
      'subjectEndTime' : subjectEndTime,
      'subjectTeacher' : subjectTeacher,
    };

    if(routineId != null) {
      map['routineId'] = routineId;
    }
    return map;
  }

  static Routine fromMap(Map<String, dynamic> map) {
    return Routine(
      routineId: map['routineId'],
      routineDate: map['routineDate'],
      routineSubject: map['routineSubject'],
      subjectStartTime: map['subjectStartTime'],
      subjectEndTime: map['subjectEndTime'],
      subjectTeacher: map['subjectTeacher'],
    );
  }
}
