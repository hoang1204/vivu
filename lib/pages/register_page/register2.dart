import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final cungHoangDao = [
    "Bạch Dương",
    "Kim Ngưu",
    "Song Tử",
    "Cự Giải",
    "Sư Tử",
    "Xử Nữ",
    "Thiên Bình",
    "Bọ Cạp",
    "Nhân Mã",
    "Ma Kết",
    "Bảo Bình",
    "Song Ngư",
  ];
  final doiTuong = [
    "Người yêu",
    "Bạn mới",
    "Bạn đi chơi",
    "Bạn rượu",
    "Người trò chuyện",
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
                    controller: soThichController,
                    decoration: InputDecoration(
                      labelText: "Sở thích (*)",
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
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Bạn muốn tìm ai (*)",
                      border: OutlineInputBorder(),
                    ),
                    value: doiTuongController,
                    items: doiTuong
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        doiTuongController = value as String;
                        print(doiTuongController);
                      });
                    },
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
                    controller: facebookController,
                    decoration: InputDecoration(
                      labelText: "Facebook",
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
                      labelText: "Cung hoàng đạo (*)",
                      border: OutlineInputBorder(),
                    ),
                    value: cungHoangDaoController,
                    items: cungHoangDao
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        cungHoangDaoController = value as String;
                        print(cungHoangDaoController);
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
            "Tình trạng",
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
                  title: Text("Độc thân"),
                  value: "1",
                  groupValue: tinhTrang,
                  onChanged: (value) {
                    setState(() {
                      tinhTrang = value as String;
                    });
                  },
                ),
              ),
              Container(
                width: 200,
                child: RadioListTile(
                  title: Text("Hẹn hò"),
                  value: "0",
                  groupValue: tinhTrang,
                  onChanged: (value) {
                    setState(() {
                      tinhTrang = value as String;
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
