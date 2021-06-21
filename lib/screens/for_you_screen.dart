import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/widgets/event_widget.dart';

class ForYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('events').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              documents.map((e) {
                print(e['title']);
              });
              return ListView(
                  children: documents
                      .map(
                        (doc) => EventWidget(
                          circleImg: doc['circleImg'],
                          match: doc['match'].toString(),
                          title: doc['title'],
                          price: doc['price'].toString(),
                          fullTitle: doc['fullTitle'],
                          dateTime: doc['dateTime'],
                          location: doc['location'],
                          featuredImg: doc['featuredImg'],
                        ),
                      )
                      .toList());
            } else if (snapshot.hasError) {
              return Text('Its Error!');
            } else {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          }),
    );
  }
}
