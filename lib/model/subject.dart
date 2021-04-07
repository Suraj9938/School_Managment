import 'package:flutter/cupertino.dart';

class Subject with ChangeNotifier {
  String subjectId;
  String subjectName;

  Subject({
    this.subjectId,
    this.subjectName,
  });
}
