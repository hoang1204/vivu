import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Quan extends ConsumerStatefulWidget {
  const Quan({super.key});

  @override
  ConsumerState<Quan> createState() => _QuanState();
}

class _QuanState extends ConsumerState<Quan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 240, 240),
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icon.png",
              width: 30,
            ),
            Image.asset(
              "assets/images/name.png",
              width: 80,
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Text("Gu"),
    );
  }
}
