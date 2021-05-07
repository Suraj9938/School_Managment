import 'package:flutter/material.dart';

class BookListView extends StatelessWidget {
  final String bookId;
  final String bookName;
  final String bookImage;

  BookListView(
    this.bookId,
    this.bookName,
    this.bookImage,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: 60,
        child: ListTile(
          title: Text(
            bookName,
            style: TextStyle(
              fontSize: 15,
              fontFamily: "font2",
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(bookImage),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.orange,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
