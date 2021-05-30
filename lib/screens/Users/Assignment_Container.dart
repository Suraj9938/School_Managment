import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:school_management/model/assignment.dart';
import 'package:school_management/provider/user_assignment_provider.dart';

class AssignmentContainer extends StatelessWidget {
  final String className;
  final String subjectName;
  final String task;
  final String image;
  final String deadline;

  AssignmentContainer(
    this.className,
    this.subjectName,
    this.task,
    this.image,
    this.deadline,
  );

  @override
  Widget build(BuildContext context) {
    // print("From Assignment Container");
    // print(className);
    // print(subjectName);
    // print(task);
    // print(image);
    // print(deadline);
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Task :",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  fontFamily: "font1",
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80,
                child: ReadMoreText(
                  task,
                  style: TextStyle(
                    fontFamily: "font2",
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.justify,
                  colorClickableText: Colors.orange,
                  trimExpandedText: "See Less",
                  trimCollapsedText: "See More",
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Subject : $subjectName | Class: $className",
                style: TextStyle(
                  fontFamily: "font2",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                  ),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Deadline: $deadline",
                style: TextStyle(
                  fontFamily: "font2",
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
