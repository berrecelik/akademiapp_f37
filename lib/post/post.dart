import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String title;
  String content;
  String author;
  DateTime createdAt;

  Post({
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
  });
  // Firebase'dan verileri çekmek için kullanılan named constructor
  Post.fromSnapshot(
    DocumentSnapshot snapshot,
  )   : title = snapshot['title'],
        content = snapshot['content'],
        author = snapshot['author'],
        createdAt = snapshot['createdAt'];
  // postId özelliği burada set ediliyor
}
