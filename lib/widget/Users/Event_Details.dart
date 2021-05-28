import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_management/model/event.dart';
import 'package:school_management/widget/Users/Event_DetailScreen.dart';

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedEvents = Provider.of<Event>(context, listen: false);

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, EventDetailScreen.routeName,
                arguments: loadedEvents.eventId);
          },
          child: Row(
            children: [
              ClipRRect(
                child: Image.network(
                  loadedEvents.eventImage,
                  height: 110,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loadedEvents.eventName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range_rounded,
                          color: Colors.blue,
                          size: 22,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          loadedEvents.eventDate,
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.green,
                          size: 22,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          loadedEvents.eventDay,
                          style: TextStyle(
                            fontFamily: "font2",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 13,
        ),
      ],
    );
  }
}
