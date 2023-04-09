import 'package:akademiapp_teamf37/haber/haber_list.dart';
import 'package:akademiapp_teamf37/homeui/glowing_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HaberPage extends StatefulWidget {
  const HaberPage({super.key});

  @override
  State<HaberPage> createState() => _HaberPageState();
}

class _HaberPageState extends State<HaberPage> {
  final _formKey = GlobalKey<FormState>();
  final _haberController = TextEditingController();
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
                MaterialPageRoute(builder: (context) => HaberList()),
              );
            },
            child: const Text(
              'Tüm Haberler',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("Haber"),
      ),
      body: Form(
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
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Yeni Haberler",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent[100]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.blue,
                    controller: _konuController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        labelText: 'Konu Başlığı',
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.redAccent)),
                  ),
                  TextFormField(
                    cursorColor: Colors.blue,
                    controller: _haberController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        labelText: 'Haber ekleyin',
                        labelStyle:
                            TextStyle(fontSize: 15, color: Colors.redAccent)),
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
                          // Step 5: Add the post to Firestore
                          await FirebaseFirestore.instance
                              .collection('haber')
                              .add({
                            'haber': _haberController.text,
                            'konu': _konuController.text
                          });
                          setState(() {
                            _haberController.text = "";
                            _konuController.text = "";
                          });

                          // Step 6: Navigate to the post list page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HaberList()),
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
    );
  }
}
