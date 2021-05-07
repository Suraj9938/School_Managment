import 'package:flutter/cupertino.dart';

class Assignment with ChangeNotifier{
  final String assignmentId;
  final String task;
  final String image;
  final String deadline;

  Assignment({
    this.assignmentId,
    this.task,
    this.image,
    this.deadline,
  });
}
