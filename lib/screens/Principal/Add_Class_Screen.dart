import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AddClassScreen extends StatefulWidget {
  static const routeName = 'addclass';

  @override
  _AddClassScreenState createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Classes",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: Material(
                borderRadius: BorderRadius.circular(34),
                color: Colors.grey[300],
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.class_,
                      color: Colors.blueGrey,
                    ),
                    labelText: "Class Name",
                    labelStyle: TextStyle(
                      fontFamily: "font2",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.blueGrey,
                    ),
                    focusColor: Colors.red,
                    contentPadding: EdgeInsets.only(bottom: 20, right: 20),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.only(
      //     top: 10,
      //     bottom: 24,
      //   ),
      //   child: ListView.builder(
      //     itemBuilder: (ctx, index) {
      //       return Card(
      //         elevation: 4,
      //         margin: EdgeInsets.symmetric(
      //           horizontal: 20,
      //           vertical: 6,
      //         ),
      //         child: Container(
      //           padding: EdgeInsets.only(
      //             left: 20,
      //             top: 20,
      //           ),
      //           height: 65,
      //           child: Text(
      //             "Class Seven",
      //             style: TextStyle(
      //               fontFamily: "font2",
      //               fontWeight: FontWeight.w500,
      //               color: Colors.orange,
      //               fontSize: 22,
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //     itemCount: 12,
      //   ),
      // ),
    );
  }
}
