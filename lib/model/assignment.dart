import 'package:flutter/material.dart';
import 'package:school_management/model/auth.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/model/subject.dart';

class Assignment with ChangeNotifier {
  String assignmentId, task, image, deadline;

  Assignment({
    this.assignmentId,
    this.task,
    this.image,
    this.deadline,
  });
}

class UserAssignment with ChangeNotifier {
  Assignment assignment;
  Auth user;
  Class classs;
  Subject subject;

  UserAssignment({this.user, this.classs, this.assignment, this.subject});
}
