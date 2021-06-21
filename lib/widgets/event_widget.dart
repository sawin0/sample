import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String title;
  final String location;
  final String featuredImg;
  final String fullTitle;
  final String dateTime;
  final String price;
  final String match;
  final String circleImg;

  EventWidget(
      {required this.title,
      required this.location,
      required this.featuredImg,
      required this.fullTitle,
      required this.dateTime,
      required this.price,
      required this.match,
      required this.circleImg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(circleImg),
                    radius: 30.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.pin_drop_outlined),
                          SizedBox(
                            width: 2,
                          ),
                          Text(location),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_horiz),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CachedNetworkImage(
                imageUrl: featuredImg,
                placeholder: (context, url) => CircularProgressIndicator(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                dateTime,
                style: TextStyle(color: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                fullTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$$price"),
                  Text(
                    '$match% Match',
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
