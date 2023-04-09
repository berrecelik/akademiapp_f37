import 'package:flutter/material.dart';

class ToDoListPage2 extends StatefulWidget {
  const ToDoListPage2({Key? key}) : super(key: key);

  @override
  State<ToDoListPage2> createState() => _ToDoListPage2State();
}

class _ToDoListPage2State extends State<ToDoListPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text("Listem"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyContainer(
                isChecked: false,
                message: "  Flutter'ın 11. dersini izle",
                color: Colors.redAccent.shade100),
            MyContainer(
                isChecked: false,
                message: "  GitHub ödevini yap",
                color: Colors.redAccent.shade100),
            MyContainer(
                isChecked: false,
                message: "  İngilizce derslerini izle",
                color: Colors.redAccent.shade100),
            MyContainer(
                isChecked: true,
                message: " Girişimcilik eğitimini izle",
                color: Colors.red.shade100),
            MyContainer(
                isChecked: true,
                message: "  Coursera videosu izle",
                color: Colors.red.shade100),
            MyContainer(
                isChecked: true, message: "  Uyan", color: Colors.red.shade100),
            Container(
              width: 50,
              height: 50,
              child: Card(
                  color: Colors.red.shade100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.add,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  final bool isChecked;
  final String message;
  final Color color;

  const MyContainer({
    Key? key,
    required this.isChecked,
    required this.message,
    required this.color,
  }) : super(key: key);

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      width: 450,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        color: widget.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.message,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            Checkbox(
              value: isChecked,
              checkColor: Colors.black,
              activeColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
