import 'package:flutter/cupertino.dart';

class Subject with ChangeNotifier {
  String subjectId;
  String subjectName;
  bool isChecked = false;

  Subject({
    this.subjectId,
    this.subjectName,
    this.isChecked
  });
}
