import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:school_management/model/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books {
    return [..._books];
  }

  Book findById(String id) {
    return _books.firstWhere((book) => book.bookId == id);
  }

  Future<https.Response> addBook(_bookData, images) async {
    final resUrl = "http://192.168.0.20:8000/api/addbook/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(
        https.MultipartFile.fromBytes('image', images, filename: "book.png"));

    request.fields['bookName'] = _bookData['bookName'];
    request.fields['bookType'] = _bookData['bookType'];
    request.fields['publisher'] = _bookData['publisher'];
    request.fields['publishYear'] = _bookData['publishYear'];
    request.fields['ratingNo'] = _bookData['ratingNo'];
    request.fields['userRating'] = _bookData['userRating'];
    request.fields['bookDescription'] = _bookData['bookDescription'];

    https.Response response = await https.Response.fromStream(
      await request.send(),
    );
    return response;
  }

  Future<https.Response> setFetchedBooksData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewbook/";
    var url = Uri.parse(resUrl);
    List<Book> bookList = [];

    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);
      List books = json.decode(response.body);

      for (int i = 0; i < books.length; i++) {
        var bookRes = books[i];
        bookList.add(
          new Book(
            bookId: bookRes['id'].toString(),
            bookName: bookRes['bookName'],
            bookType: bookRes['bookType'],
            bookImage: bookRes['image'].toString(),
            publisher: bookRes['publisher'],
            publishYear: bookRes['publishYear'],
            ratingNo: bookRes['ratingNo'],
            userRating: bookRes['userRating'],
            bookDescription: bookRes['bookDescription'],
          ),
        );
      }
      _books = bookList;
      notifyListeners();
    } catch (error) {
      return null;
    }
  }

  //get search book list
  List<Book> getSearchBook(String query) {
    if (query.isNotEmpty && query != null) {
      return _books
          .where((book) => book.bookName.toLowerCase().startsWith(query))
          .toList();
    }
    notifyListeners();
    return [];
  }
}
