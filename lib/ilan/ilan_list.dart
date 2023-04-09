import 'package:akademiapp_teamf37/ilan/ilan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IlanList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('İlanlar'),
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
              final ilan = Ilan(
                ilan: snapshot.data!.docs[index]['ilan'],
                detay: snapshot.data!.docs[index]['detay'],
              );

              return Card(
                color: Colors.grey[200],
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(ilan.ilan),
                  subtitle: Text(ilan.detay),
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
