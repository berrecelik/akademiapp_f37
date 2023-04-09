import 'package:akademiapp_teamf37/homepage.dart';
import 'package:akademiapp_teamf37/homeui/glowing_button.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akademiye Sorum?'),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            GlowingButton(
              color1: Colors.redAccent,
              color2: Colors.white70,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              buttonText: '1.Sayfa',
            ),
            const SizedBox(
              height: 50,
            ),
            GlowingButton(
              color1: Colors.pinkAccent,
              color2: Colors.indigoAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              buttonText: '2.Sayfa',
            ),
            const SizedBox(
              height: 50,
            ),
            GlowingButton(
              color1: Colors.pinkAccent,
              color2: Colors.indigoAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              buttonText: '3.Sayfa',
            ),
            const SizedBox(
              height: 50,
            ),
            GlowingButton(
              color1: Colors.pinkAccent,
              color2: Colors.indigoAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              buttonText: '4.Sayfa',
            ),
            const SizedBox(
              height: 50,
            ),
            GlowingButton(
              color1: Colors.pinkAccent,
              color2: Colors.indigoAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              buttonText: '5.sayfa',
            ),
          ],
        ),
      ),
    );
  }
}
