import 'package:akademiapp_teamf37/homeui/glowing_button.dart';
import 'package:akademiapp_teamf37/ilan/ilan_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StajIsPage extends StatefulWidget {
  const StajIsPage({super.key});

  @override
  State<StajIsPage> createState() => _StajIsPageState();
}

class _StajIsPageState extends State<StajIsPage> {
  final _formKey = GlobalKey<FormState>();
  final _ilanController = TextEditingController();
  final _detayController = TextEditingController();
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
                MaterialPageRoute(builder: (context) => AdList()),
              );
            },
            child: const Text(
              'Tüm İlanlar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("İlanlar"),
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
                        "Yeni ilan Ekle",
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
                        controller: _ilanController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelText: 'İlan Başlığı',
                            labelStyle: TextStyle(
                                fontSize: 15, color: Colors.redAccent)),
                      ),
                      TextFormField(
                        cursorColor: Colors.redAccent,
                        controller: _detayController,
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
                                  .collection('ilan')
                                  .add({
                                'ilan': _ilanController.text,
                                'detay': _detayController.text,
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdList()),
                              );
                              setState(() {
                                _ilanController.text = "";
                                _detayController.text = "";
                              });
                            }
                          },
                          buttonText: 'Ekle',
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
