import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.height=100});
  final double height;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
              radius: height/2,
              child: ClipOval(
                  child: Image.asset(
                'assets/images/pizza.png',
                fit: BoxFit.cover,
                height: height,
                width: height,
              )),
            );
  }
}