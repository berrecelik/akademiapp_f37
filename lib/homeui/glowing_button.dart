import 'package:flutter/material.dart';

class GlowingButton extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String buttonText;
  final Function()? onTap;
  const GlowingButton({
    super.key,
    this.color1 = Colors.cyan,
    this.color2 = Colors.greenAccent,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var glowing = true;
    var scale = 1.0;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 45,
        width: 135,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: color1.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(8, 0),
                    ),
                    BoxShadow(
                      color: color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
