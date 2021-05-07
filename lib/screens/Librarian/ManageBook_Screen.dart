import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/screens/Librarian/AddBook_Screen.dart';
import 'package:school_management/widget/Librarian/Book_ListView.dart';

class ManageBookScreen extends StatelessWidget {
  static const routeName = "/manage_books";

  Future<void> _refreshBooks(BuildContext context) async {
    await Provider.of<BookProvider>(context, listen: false)
        .setFetchedBooksData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manage Books",
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddBookScreen.routeName);
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: _refreshBooks(context),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => _refreshBooks(context),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Consumer<BookProvider>(
                      builder: (ctx, book, _) {
                        return ListView.builder(
                          itemBuilder: (ctx, index) => BookListView(
                            book.books[index].bookId,
                            book.books[index].bookName,
                            book.books[index].bookImage,
                          ),
                          itemCount: book.books.length,
                        );
                      },
                    ),
                  ),
                );
        },
      ),
    );
  }
}
