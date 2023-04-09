import 'package:cloud_firestore/cloud_firestore.dart';

class Link {
  String link;
  String konu;

  Link({
    required this.link,
    required this.konu,
  });

  // Firebase'dan verileri çekmek için kullanılan named constructor
  Link.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : link = snapshot['link'],
        konu = snapshot['konu'];
}
