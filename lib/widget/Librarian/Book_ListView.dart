import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/screens/Librarian/AddBook_Screen.dart';
import 'package:school_management/screens/Librarian/ManageBook_Screen.dart';

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
    final scaffold = Scaffold.of(context);

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
                  onPressed: () async {
                    Navigator.pushNamed(context, AddBookScreen.routeName,
                        arguments: bookId);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.orange,
                  ),
                  onPressed: () async {
                    try {
                      final response = await Provider.of<BookProvider>(context,
                              listen: false)
                          .deleteBookByID(bookId);
                      print("response.statusCode");
                      print(response.statusCode);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201 ||
                          response.statusCode == 204) {
                        return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text('Success'),
                                  content:
                                      Text("Book was deleted successfully"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Okay'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    )
                                  ],
                                )).then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed(ManageBookScreen.routeName),
                        );
                      } else {
                        return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  title: Text('Failure'),
                                  content: Text("Book could not be removed!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Okay'),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                    )
                                  ],
                                )).then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed(ManageBookScreen.routeName),
                        );
                      }
                    } catch (error) {
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text(error.message),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
