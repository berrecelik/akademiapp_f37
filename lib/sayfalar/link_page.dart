import 'package:akademiapp_teamf37/link/link_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../homeui/glowing_button.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({super.key});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  final _formKey = GlobalKey<FormState>();
  final _linkController = TextEditingController();
  final _konuController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LinkList()),
              );
            },
            child: const Text(
              'Tüm Linkler',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("Linkler"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: SizedBox(
              height: 270,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Yeni linkler",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent[100]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: Colors.redAccent,
                        controller: _konuController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelText: 'Kategori Başlığı',
                            labelStyle: TextStyle(
                                fontSize: 15, color: Colors.redAccent)),
                      ),
                      TextFormField(
                        cursorColor: Colors.redAccent,
                        controller: _linkController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelText: 'Link ekleyin',
                            labelStyle: TextStyle(
                                fontSize: 15, color: Colors.redAccent)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: GlowingButton(
                          color1: Colors.redAccent,
                          color2: Colors.white70,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await FirebaseFirestore.instance
                                  .collection('links')
                                  .add({
                                'link': _linkController.text,
                                'konu': _konuController.text,
                              });
                              setState(() {
                                _linkController.text = "";
                                _konuController.text = "";
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LinkList()),
                              );
                            }
                          },
                          buttonText: 'Gönder',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
