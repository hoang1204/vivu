import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../action/imagepicker.dart';

class Register3 extends StatefulWidget {
  const Register3({super.key});

  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.jpg",
          fit: BoxFit.cover,
          width: 500,
        ),
        Positioned(
          top: 30,
          left: 15,
          right: 15,
          child: Text(
            "Hãy upload một số bức ảnh của bản thân (Tối thiểu 1 cái)",
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: SetPhotoScreen(),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: SetPhotoScreen()),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: SetPhotoScreen()),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: SetPhotoScreen()),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: SetPhotoScreen()),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: SetPhotoScreen()),
            ],
          ),
        )
      ],
    );
  }
}
