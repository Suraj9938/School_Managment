import 'package:flutter/cupertino.dart';

class School with ChangeNotifier {
  String schoolId;
  String schoolName;
  String schoolContact;
  String schoolImage;
  String startTime;
  String endTime;
  String location;
  String schoolDescription;

  School({
    this.schoolId,
    this.schoolName,
    this.schoolContact,
    this.schoolImage,
    this.startTime,
    this.endTime,
    this.location,
    this.schoolDescription,
  });
}

