import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/subject.dart';

class SubjectCheckBoxDetails extends StatefulWidget {
  List<String> subjects = [];

  SubjectCheckBoxDetails(this.subjects);

  @override
  _SubjectCheckBoxDetailsState createState() => _SubjectCheckBoxDetailsState();
}

class _SubjectCheckBoxDetailsState extends State<SubjectCheckBoxDetails> {
  @override
  Widget build(BuildContext context) {
    final loadedSubjects = Provider.of<Subject>(context, listen: false);

    if (loadedSubjects.isChecked == null) {
      setState(() {
        loadedSubjects.isChecked = false;
      });
    }

    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        loadedSubjects.subjectName,
        style: TextStyle(
          fontFamily: "font2",
          fontSize: 16,
        ),
      ),
      selected: loadedSubjects.isChecked,
      value: loadedSubjects.isChecked,
      onChanged: (value) {
        print("checked vaue : $value");
        setState(() {
          loadedSubjects.isChecked = !loadedSubjects.isChecked;
        });
        print(widget.subjects);
        //widget.subjectNames.clear();
        if (loadedSubjects.isChecked == true &&
            !widget.subjects.contains(loadedSubjects.subjectId)) {
          widget.subjects.add(loadedSubjects.subjectName);
          print("selected subjects");
          print(widget.subjects);
        } else if (loadedSubjects.isChecked == false &&
            widget.subjects.contains(loadedSubjects.subjectId)) {
          widget.subjects
              .removeWhere((element) => element == loadedSubjects.subjectName);
          print("removed subject info");
          print(widget.subjects);
        }
      },
    );
  }
}
