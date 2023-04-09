import 'package:cloud_firestore/cloud_firestore.dart';

class Haber {
  String haber;
  String konu;

  Haber({
    required this.haber,
    required this.konu,
  });

  // Firebase'dan verileri çekmek için kullanılan named constructor
  Haber.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : haber = snapshot['haber'],
        konu = snapshot['konu'];
}
