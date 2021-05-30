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

  Future<https.Response> addBook(initValues, images) async {
    final resUrl = "http://192.168.0.20:8000/api/addbook/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(
        https.MultipartFile.fromBytes('image', images, filename: "book.png"));

    request.fields['bookName'] = initValues['bookName'];
    request.fields['bookType'] = initValues['bookType'];
    request.fields['publisher'] = initValues['publisher'];
    request.fields['publishYear'] = initValues['publishYear'];
    request.fields['ratingNo'] = initValues['ratingNo'];
    request.fields['userRating'] = initValues['userRating'];
    request.fields['bookDescription'] = initValues['bookDescription'];

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

  Future<https.Response> updateBookInfo(
      String bookId, initValues, images) async {
    final resUrl = "http://192.168.0.20:8000/api/updatebook/$bookId/";
    var url = Uri.parse(resUrl);

    try {
      final request = https.MultipartRequest('PATCH', url);
      //request.
      //if (images != null) request.fields['image'] = images.toString();

      // request.files.add(
      //     https.MultipartFile.fromBytes('image', images, filename: 'a.jpg'));

      request.fields['bookName'] = initValues['bookName'];
      request.fields['bookType'] = initValues['bookType'];
      request.fields['publisher'] = initValues['publisher'];
      request.fields['publishYear'] = initValues['publishYear'];
      request.fields['ratingNo'] = initValues['ratingNo'];
      request.fields['userRating'] = initValues['userRating'];
      request.fields['bookDescription'] = initValues['bookDescription'];

      https.Response response = await https.Response.fromStream(
        await request.send(),
      );
      print(response.body);
      return response;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<https.Response> deleteBookByID(String bookId) async {
    final resUrl = "http://192.168.0.20:8000/api/deletebook/$bookId/";
    var url = Uri.parse(resUrl);
    https.Response response = await https.delete(url);

    return response;
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
