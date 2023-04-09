import 'package:akademiapp_teamf37/post/postlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../homeui/glowing_button.dart';

class PostForm extends StatefulWidget {
  const PostForm({
    super.key,
  });
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Akademi Soru-Cevap'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.list,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostList()),
              );
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  labelText: 'Soru Başlığı',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.redAccent)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen başlık girin';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _contentController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen içeriği boş bırakmayın';
                }
                return null;
              },
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  labelText: 'İçerik',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.redAccent)),
              maxLines: null,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  labelText: 'İsim',
                  labelStyle: TextStyle(fontSize: 18, color: Colors.redAccent)),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen ismi boş bırakmayın';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Center(
              child: GlowingButton(
                color1: Colors.redAccent,
                color2: Colors.white70,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    // Step 5: Add the post to Firestore
                    await FirebaseFirestore.instance.collection('posts').add({
                      'title': _titleController.text,
                      'content': _contentController.text,
                      'author': _authorController.text,
                      'createdAt': DateTime.now(),
                    });

                    // Step 6: Navigate to the post list page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostList()),
                    );
                  }
                },
                buttonText: 'Gönder',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
