import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/pages/register_page/register1.dart';
import 'package:vivu/pages/register_page/register2.dart';
import 'package:vivu/pages/register_page/register4.dart';
import 'package:vivu/pages/register_page/register3.dart';
import 'package:vivu/pages/register_page/register0.dart';

import '../global.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // TextEditingController tenHienThiController = TextEditingController();
  // TextEditingController sdtController = TextEditingController();
  // TextEditingController noiSongController = TextEditingController();
  // String truongHocController = "Đại học CNTT & TT (ICTU)";
  var _currentIndex = 0;
  final List<Widget> Register = [
    Register1(),
    Register2(),
    Register3(),
    Register4(),
    Register0(),
  ];
  // late PageController _pageController;
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
      body: PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) {
          return FadeThroughTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
          );
        },
        child: Register[_currentIndex],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                if (_currentIndex != 0)
                  _currentIndex--;
                else
                  _currentIndex = 0;
              });
            },
            child: Container(
              width: 80,
              height: 32,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 78, 127),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Previos",
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                print(_currentIndex);
                if (tuoiController.text != "" &&
                    int.parse(tuoiController.text) < 16) {
                  Fluttertoast.showToast(
                    msg: "Bạn phải trên 16 tuổi",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20,
                  );
                } else if (_currentIndex == 0 &&
                    (tenHienThiController.text == "" ||
                        noiSongController.text == "" ||
                        gioiTinh == null))
                  Fluttertoast.showToast(
                    msg: "Hãy điền đầy đủ thông tin!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20,
                  );
                else if (_currentIndex == 1 &&
                    (soThichController.text == "" || tinhTrang == null)) {
                  Fluttertoast.showToast(
                    msg: "Hãy điền đầy đủ thông tin!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20,
                  );
                } else if (_currentIndex == 2 && files.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Hãy chọn ít nhất 1 bức ảnh!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20,
                  );
                } else if (_currentIndex != 4) {
                  _currentIndex++;
                } else
                  _currentIndex = 4;
              });
            },
            child: Container(
              width: 80,
              height: 32,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 78, 127),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
