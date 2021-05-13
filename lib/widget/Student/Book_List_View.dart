import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/widget/Student/Book_Details.dart';

class BookListView extends StatelessWidget {
  Future<void> _fetchBooks(BuildContext context) async {
    await Provider.of<BookProvider>(context, listen: false)
        .setFetchedBooksData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchBooks(context),
      builder: (context, snapshot) {
        return Consumer<BookProvider>(
          builder: (context, book, _) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                      value: book.books[index],
                      child: BookDetails(),
                    ),
                    itemCount: book.books.length,
                  );
          },
        );
      },
    );
  }
}
