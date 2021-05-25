import 'package:flutter/material.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/model/subject.dart';

class ClassSubject with ChangeNotifier {
  final String classSubjectId;
  final Class classes;
  final List<Subject> subjects;

  ClassSubject({
    this.classSubjectId,
    this.classes,
    this.subjects,
  });
}
