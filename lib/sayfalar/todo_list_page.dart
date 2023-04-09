import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../card/todorcard.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection("ToDo").snapshots();
  //source of stream
  List<Select> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Yapılacaklar Listem",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent[100],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 12),
        child: StreamBuilder(
            stream: _stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> document = snapshot.data?.docs[index]
                        .data() as Map<String, dynamic>;

                    selected.add(Select(
                        id: snapshot.data!.docs[index].id, checkValue: false));
                    return InkWell(
                      onTap: () {},
                      child: ToDoCard(
                        title: document["title"] == null
                            ? "Hey!"
                            : document["title"],
                        check: selected[index].checkValue,
                        index: index,
                        onChange: onChange,
                      ),
                    );
                  });
            }),
      ),
    );
  }

  void onChange(int index) {
    setState(() {
      selected[index].checkValue = !selected[index].checkValue;
    });
  }
}

class Select {
  String id;
  bool checkValue = false;
  Select({
    required this.id,
    required this.checkValue,
  });
}
