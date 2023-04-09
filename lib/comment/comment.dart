import 'package:cloud_firestore/cloud_firestore.dart';

class CommentClass {
  String comment;
  String name;

  CommentClass({
    required this.comment,
    required this.name,
  });

  CommentClass.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : comment = snapshot['comment'],
        name = snapshot['name'];
}
