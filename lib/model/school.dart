import 'package:flutter/cupertino.dart';

class School with ChangeNotifier{
  final String schoolId;
  final String schoolName;
  final String schoolContact;
  final String schoolImage;
  final String startTime;
  final String endTime;
  final String location;
  final String schoolDescription;

  School({
    @required this.schoolId,
    @required this.schoolName,
    @required this.schoolContact,
    this.schoolImage,
    this.startTime,
    this.endTime,
    @required this.location,
    @required this.schoolDescription,
  });
}

