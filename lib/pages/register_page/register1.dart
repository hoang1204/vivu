import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final university = [
    "Đại học CNTT & TT (ICTU)",
    "Đại học công nghiệp (TNUT)",
    "Đại học nông lâm (TUAF)",
    "Đại học KT & QTKD (TUEBA)",
    "Đại học sư phạm (TNUE)",
    "Đại học y dược (TUMP)",
    "Khoa ngoại ngữ(SFL)",
    "Đại học khoa học (TNUS)",
    "Khác",
  ];
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
            left: 25,
            child: Text(
              "Nhập thông tin để hoàn tất đăng ký",
              style: GoogleFonts.aBeeZee(fontSize: 20),
            )),
        Positioned(
            top: 60,
            left: 85,
            child: Text(
              "Các mục (*) bắt buộc phải điền",
              style: GoogleFonts.aBeeZee(fontSize: 15),
            )),
        Positioned(
          top: 90,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: tenHienThiController,
                    decoration: InputDecoration(
                      labelText: "Tên hiển thị (*)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 170,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: tuoiController,
                    decoration: InputDecoration(
                      labelText: "Tuổi (16+) (*)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 250,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    controller: noiSongController,
                    decoration: InputDecoration(
                      labelText: "Nơi sống (*)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 330,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Trường đang học (*)",
                      border: OutlineInputBorder(),
                    ),
                    value: truongHocController,
                    items: university
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        truongHocController = value as String;
                        print(truongHocController);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 410,
          left: 40,
          child: Text(
            "Giới tính",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Positioned(
          top: 430,
          left: 30,
          child: Row(
            children: [
              Container(
                width: 200,
                child: RadioListTile(
                  title: Text("Nam"),
                  value: "1",
                  groupValue: gioiTinh,
                  onChanged: (value) {
                    setState(() {
                      gioiTinh = value as String;
                    });
                  },
                ),
              ),
              Container(
                width: 200,
                child: RadioListTile(
                  title: Text("Nữ"),
                  value: "0",
                  groupValue: gioiTinh,
                  onChanged: (value) {
                    setState(() {
                      gioiTinh = value as String;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
