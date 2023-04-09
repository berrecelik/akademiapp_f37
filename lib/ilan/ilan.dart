import 'package:cloud_firestore/cloud_firestore.dart';

class Ad {
  String ilan;
  String detay;

  Ad({
    required this.ilan,
    required this.detay,
  });

  Ad.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : ilan = snapshot['ilan'],
        detay = snapshot['detay'];
}
