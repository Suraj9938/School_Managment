import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/provider/book_provider.dart';
import 'package:school_management/widget/Student/Book_Info_Screen.dart';

class SearchDelegateCustom extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchBooks =
        Provider.of<BookProvider>(context, listen: false).getSearchBook(query);
    return ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 18,
              top: 2,
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(searchBooks[index].bookImage),
            ),
            title: Text(
              searchBooks[index].bookName,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "font2",
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, BookInfoScreen.routeName,
                  arguments: searchBooks[index].bookId);
            },
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
      itemCount: searchBooks.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchBooks =
        Provider.of<BookProvider>(context, listen: false).getSearchBook(query);
    return query.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/search.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Search for a Book",
                  style: TextStyle(
                    fontFamily: "font1",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 18,
                    top: 2,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(searchBooks[index].bookImage),
                  ),
                  title: Text(
                    searchBooks[index].bookName,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "font2",
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, BookInfoScreen.routeName,
                        arguments: searchBooks[index].bookId);
                  },
                ),
                Divider(),
              ],
            ),
            itemCount: searchBooks.length,
          );
  }
}
