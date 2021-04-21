import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;

class BookProvider with ChangeNotifier {
  Future<https.Response> addBook(_bookData, images) async {
    final resUrl = "http://192.168.0.19:8000/api/addbook/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);

    request.files.add(https.MultipartFile.fromBytes('image', images, filename: "book.png"));

    request.fields['bookName'] = _bookData['bookName'];
    request.fields['bookType'] = _bookData['bookType'];
    request.fields['publisher'] = _bookData['publisher'];
    request.fields['publishYear'] = _bookData['publishYear'];
    request.fields['ratingNo'] = _bookData['ratingNo'];
    request.fields['userRating'] = _bookData['userRating'];
    request.fields['bookDescription'] = _bookData['bookDescription'];

    await request.send();
  }
}