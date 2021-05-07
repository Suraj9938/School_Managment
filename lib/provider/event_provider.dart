import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';
import 'package:school_management/model/event.dart';
import 'package:school_management/model/school.dart';
import 'package:school_management/provider/school_provider.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events {
    return [..._events];
  }

  Future<https.Response> addEvent(BuildContext context, _events, images) async {
    final resUrl = "http://192.168.0.20:8000/api/addevent/";
    var url = Uri.parse(resUrl);
    var request = https.MultipartRequest('POST', url);
    School schoolInfo;
    Provider.of<SchoolProvider>(context, listen: false)
        .setFetchSchoolData()
        .then((value) {
      schoolInfo =
          Provider.of<SchoolProvider>(context, listen: false).schoolData;
    });

    print("eventInfo");
    final baseUrl = "http://192.168.0.20:8000/api/";

    request.files.add(
        https.MultipartFile.fromBytes('image', images, filename: 'event.png'));

    request.fields['eventName'] = _events['eventName'];
    request.fields['eventDate'] = _events['eventDate'];
    request.fields['eventDay'] = _events['eventDay'];
    request.fields['eventStartTime'] = _events['eventStartTime'];
    request.fields['eventEndTime'] = _events['eventEndTime'];
    request.fields['eventDescription'] = _events['eventDescription'];

    print(request.fields['eventName']);
    print(request.fields['eventDate']);
    print(request.fields['eventDay']);
    print(request.fields['eventStartTime']);
    print(request.fields['eventEndTime']);
    print(request.fields['eventDescription']);

    https.Response response = await https.Response.fromStream(
      await request.send(),
    );

    var eventRes = json.decode(response.body);
    print(eventRes);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, String> eventSchoolInfo = {
        'event': eventRes['id'].toString(),
        'school': schoolInfo.schoolId,
      };
      print("school Id");
      print(schoolInfo.schoolId);
      var url = Uri.parse(baseUrl + 'eventschool/');
      https.Response eventSchool = await https.post(url, body: eventSchoolInfo);
      print("From Auth Provider event school");
      print(eventSchool);
      return eventSchool;
    } else {
      return response;
    }
  }

  Future<https.Response> setFetchEventData() async {
    final resUrl = "http://192.168.0.20:8000/api/viewevent/";
    var url = Uri.parse(resUrl);

    try {
      final response = await https.get(
        url,
      );
      print("Set Fetched Response");
      print(response.body);

      List<dynamic> event = List<dynamic>();
      event = json.decode(response.body);
      print("Event from Event Provider");
      print(event);
      print("event length");
      print(event.length);

      _events.clear();
      for (int i = 0; i < event.length; i++) {
        final eventInfo = Event(
          eventId: event[i]['id'].toString(),
          eventName: event[i]['eventName'],
          eventDate: event[i]['eventDate'],
          eventStartTime: event[i]['eventStartTime'],
          eventEndTime: event[i]['eventEndTime'],
          eventDay: event[i]['eventDay'],
          eventDescription: event[i]['eventDescription'],
        );
        _events.add(eventInfo);
        notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }
}
