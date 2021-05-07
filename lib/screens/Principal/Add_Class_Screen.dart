import 'package:flutter/material.dart';

class AddClassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Class Information",
                style: TextStyle(
                  fontFamily: "font2",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 60,
              child: Material(
                borderRadius: BorderRadius.circular(34),
                color: Colors.grey[300],
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.class_,
                      color: Colors.orange,
                      size: 20,
                    ),
                    labelText: "Class Name",
                    labelStyle: TextStyle(
                        fontSize: 19,
                        fontFamily: "font2",
                        fontWeight: FontWeight.w600,
                        color: Colors.orange),
                    focusColor: Colors.red,
                    contentPadding:
                    EdgeInsets.only(bottom: 20, right: 20),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.name,
                  onChanged: (value) => _class['className'] = value,
                ),
              ),
            ),
          ],
        ),
      ),
    )
    ,
    );
  }
}
