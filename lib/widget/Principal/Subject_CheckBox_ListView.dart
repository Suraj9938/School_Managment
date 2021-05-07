import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/subject_provider.dart';
import 'package:school_management/widget/Principal/Subject_CheckBox_Details.dart';

class SubjectCheckBoxListView extends StatelessWidget {
  List<String> subjectNames = [];

  SubjectCheckBoxListView(this.subjectNames);

  @override
  Widget build(BuildContext context) {
    final subjectData = Provider.of<SubjectProvider>(context, listen: false).setFetchSubjectData();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.8,
      child: FutureBuilder(
        future: subjectData,
        builder: (context, snapShotData) {
          return Consumer<SubjectProvider>(
            builder: (context, subject, _) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: subject.subjects[index],
                  child: SubjectCheckBoxDetails(subjectNames),
                ),
                itemCount: subject.subjects.length,
              );
            },
          );
        },
      ),
    );
  }
}
