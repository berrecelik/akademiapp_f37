import 'package:akademiapp_teamf37/sayfalar/todo_list_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../homeui/glowing_button.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  final _titleController = TextEditingController();
  final _detayController = TextEditingController();
  String type = "";
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text("Yeni Görevler"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yeni Görev Ekle!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    label("Görev Başlığı"),
                    SizedBox(
                      height: 12,
                    ),
                    title(),
                    SizedBox(
                      height: 20,
                    ),
                    label("Detay"),
                    SizedBox(
                      height: 12,
                    ),
                    description(),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: GlowingButton(
                        color1: Colors.redAccent,
                        color2: Colors.white70,
                        onTap: () {
                          FirebaseFirestore.instance.collection("ToDo").add({
                            "title": _titleController.text,
                            "detay": _detayController.text,
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => ToDoListPage()));
                        },
                        buttonText: 'Ekle',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: TextFormField(
          controller: _detayController,
          style: TextStyle(color: Colors.black, fontSize: 17),
          maxLines: null,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Detay ekleyin..",
              hintStyle: TextStyle(color: Colors.black, fontSize: 17)),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white60, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: TextFormField(
          controller: _titleController,
          style: TextStyle(color: Colors.black, fontSize: 17),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Görev başlığı yazın..",
              hintStyle: TextStyle(color: Colors.black, fontSize: 17)),
        ),
      ),
    );
  }

  Widget label(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
