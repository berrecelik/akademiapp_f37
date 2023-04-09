import 'package:akademiapp_teamf37/post/post.dart';
import 'package:akademiapp_teamf37/post/postdetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Sorular'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
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
              final post = Post(
                title: snapshot.data!.docs[index]['title'],
                content: snapshot.data!.docs[index]['content'],
                author: snapshot.data!.docs[index]['author'],
                createdAt: snapshot.data!.docs[index]['createdAt'].toDate(),
              );

              return SizedBox(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.content),
                    trailing: Text(post.author),
                    onTap: () {
                      // Step 7: Navigate to the post detail page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetail(
                                  post: post,
                                )),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
