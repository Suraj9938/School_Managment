import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/class.dart';
import 'package:school_management/provider/class_provider.dart';
import 'package:school_management/widget/Principal/ClassDropDownDetails.dart';

class ClassDropDownListView extends StatefulWidget {
  @override
  _ClassDropDownListViewState createState() => _ClassDropDownListViewState();
}

class _ClassDropDownListViewState extends State<ClassDropDownListView> {
  bool _isInit = false;
  bool _isLoading = false;
  List<Class> _classes;
  Class _selectedClass;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ClassProvider>(context, listen: false)
          .setFetchClassData()
          .then((value) {
        _classes = Provider.of<ClassProvider>(context, listen: false).classes;
        _selectedClass = _classes[0];
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            width: double.infinity,
            height: 50,
            child: DropdownButton<Class>(
              items: _classes
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e.className),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedClass = value;
                });
              },
              value: _selectedClass,
            ),
          );
  }
}
