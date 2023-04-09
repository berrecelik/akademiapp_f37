import 'package:akademiapp_teamf37/homeui/homeui.dart';
import 'package:akademiapp_teamf37/post/post_form.dart';
import 'package:akademiapp_teamf37/profil/getusername.dart';
import 'package:akademiapp_teamf37/sayfalar/addtodo_page.dart';
import 'package:akademiapp_teamf37/sayfalar/category_page.dart';
import 'package:akademiapp_teamf37/sayfalar/profil_page.dart';
import 'package:akademiapp_teamf37/sayfalar/todo_list_page.dart';
import 'package:akademiapp_teamf37/sayfalar/todolist_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text("Ana sayfa"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Icon(
              Icons.assignment_ind,
              size: 70,
              color: Colors.redAccent[100],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Akademi'ye hoşgeldin!",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Profile()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_2),
                  SizedBox(width: 40.0),
                  Text('Profil Sayfası'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => MyCategoryListPage()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.category),
                  SizedBox(width: 30.0),
                  Text('Keşfet, Paylaş!'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => PostForm()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.question_answer),
                  SizedBox(width: 50.0),
                  Text('Soru Sorun!'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AddToDoPage()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.assignment_add),
                  SizedBox(width: 30.0),
                  Text('Yeni Görev Ekle'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ToDoListPage()));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.note_add),
                  SizedBox(width: 5.0),
                  Text('Yapılacaklar Listesi'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.redAccent),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 30.0),
                  Text('Oturumu kapat'),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
