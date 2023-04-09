import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    Key? key,
    required this.title,
    required this.check,
    required this.onChange,
    required this.index,
  }) : super(key: key);

  final String title;

  final bool check;

  final Function onChange;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Theme(
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  activeColor: Colors.grey,
                  checkColor: Colors.white,
                  value: check,
                  onChanged: (bool? check) {
                    onChange(index);
                  }),
            ),
            data: ThemeData(
              primaryColor: Colors.redAccent,
              unselectedWidgetColor: Colors.grey,
            ),
          ),
          Expanded(
            child: Container(
              height: 75,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.redAccent[100],
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
