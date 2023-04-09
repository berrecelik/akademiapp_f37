import 'package:cloud_firestore/cloud_firestore.dart';

class Ilan {
  String ilan;
  String detay;

  Ilan({
    required this.ilan,
    required this.detay,
  });

  Ilan.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : ilan = snapshot['ilan'],
        detay = snapshot['detay'];
}
