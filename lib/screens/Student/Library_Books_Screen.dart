import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/widget/Student/Book_List_View.dart';

class LibraryBooksScreen extends StatelessWidget {
  static const routeName = "/library_books";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Library Books",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: "font1",
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: BookListView(),
      ),
    );
  }
}
