import 'package:cloud_firestore/cloud_firestore.dart';

class Haber {
  String haber;
  String konu;

  Haber({
    required this.haber,
    required this.konu,
  });

  Haber.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : haber = snapshot['haber'],
        konu = snapshot['konu'];
}
