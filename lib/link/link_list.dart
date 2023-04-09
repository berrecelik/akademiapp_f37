import 'package:akademiapp_teamf37/link/link.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LinkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Linkler'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('links').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              // Step 6: Display each post as a card
              final link = Link(
                link: snapshot.data!.docs[index]['link'],
                konu: snapshot.data!.docs[index]['konu'],
              );

              return Card(
                color: Colors.grey[200],
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(link.konu),
                  subtitle: Text(link.link),
                  onTap: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
