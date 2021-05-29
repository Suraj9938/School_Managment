import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:school_management/model/assignment.dart';
import 'package:school_management/provider/user_assignment_provider.dart';

class AssignmentContainer extends StatefulWidget {
  @override
  _AssignmentContainerState createState() => _AssignmentContainerState();
}

class _AssignmentContainerState extends State<AssignmentContainer> {
  bool _isInit = false;
  bool _isLoading = false;
  List<UserAssignment> _userAssignment;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      _userAssignment =
          Provider.of<UserAssignmentProvider>(context, listen: false)
              .UserAssignments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: _userAssignment.map((e) {
            print(e.subject.subjectName);
            return ClipRRect(
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
                        e.assignment.task,
                        style: TextStyle(
                          fontFamily: "font2",
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.justify,
                        colorClickableText: Colors.orange,
                        trimExpandedText: "See More",
                        trimCollapsedText: "See Less",
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
                      "Subject : ${e.subject.subjectName} | Class: ${e.classs.className}",
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
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                        ),
                      ),
                      child: Image.network(
                        e.assignment.image,
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
                      "Deadline: ${e.assignment.deadline}",
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
            );
          }).toList(),
        ),
      ),
    );
  }
}
