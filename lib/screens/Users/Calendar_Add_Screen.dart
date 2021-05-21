import 'package:flutter/material.dart';

class CalendarAddScreen extends StatelessWidget {
  static const routeName = "/calendaraddscreen";

  final GlobalKey<FormState> _globalKey = GlobalKey();

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
      gapPadding: 0,
      borderSide: BorderSide(
        color: Colors.orange,
      ),
      borderRadius: BorderRadius.circular(25),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Information",
          style:
              TextStyle(color: Colors.white, fontSize: 22, fontFamily: "font1"),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Form(
        key: _globalKey,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.title,
                    color: Colors.orange,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  labelText: "Title",
                  labelStyle: TextStyle(
                    fontFamily: "font2",
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                    color: Colors.orange,
                  ),
                  focusColor: Colors.red,
                  border: _outlineBorder(),
                  enabledBorder: _outlineBorder(),
                  errorBorder: _outlineBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title must not be empty';
                  }
                  return null;
                },
                //onChanged: (value) => _class['className'] = value,
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.title,
                    color: Colors.orange,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  labelText: "Details",
                  labelStyle: TextStyle(
                    fontFamily: "font2",
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                    color: Colors.orange,
                  ),
                  focusColor: Colors.red,
                  border: _outlineBorder(),
                  enabledBorder: _outlineBorder(),
                  errorBorder: _outlineBorder(),
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title must not be empty';
                  }
                  return null;
                },
                //onChanged: (value) => _class['className'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
