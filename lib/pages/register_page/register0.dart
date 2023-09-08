import 'package:flutter/material.dart';

class Register0 extends StatefulWidget {
  const Register0({super.key});

  @override
  State<Register0> createState() => _Register0State();
}

class _Register0State extends State<Register0> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpg",
          fit: BoxFit.cover,
          width: 500,
        ),
        Column(),
      ],
    );
  }
}
