import 'package:akademiapp_teamf37/comment/commentlist.dart';
import 'package:akademiapp_teamf37/homeui/glowing_button.dart';
import 'package:akademiapp_teamf37/post/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final Post post;

  PostDetail({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final _commentController = TextEditingController();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text(widget.post.title.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 200,
                  width: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.info,
                                  color: Colors.redAccent,
                                )),
                            Text(widget.post.content,
                                style: TextStyle(
                                  fontSize: 20.0,
                                )),
                            SizedBox(height: 16.0),
                            Text(
                              'İsim: ${widget.post.author}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              'Gönderi saati: ${widget.post.createdAt}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Yorumlar",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    cursorColor: Colors.redAccent,
                    controller: _nameController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        labelText: 'İsim',
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.redAccent)),
                    maxLines: null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    cursorColor: Colors.redAccent,
                    maxLength: 20,
                    controller: _commentController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        labelText: 'Yorum ekleyin',
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.redAccent)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GlowingButton(
                      color1: Colors.redAccent,
                      color2: Colors.white70,
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection('comments')
                            .add({
                          'comment': _commentController.text,
                          'name': _nameController.text.toUpperCase(),
                        });
                        setState(() {
                          _commentController.text = '';
                          _nameController.text = "";
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListComment()),
                        );
                      },
                      buttonText: 'Gönder',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
