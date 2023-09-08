import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';
import 'package:vivu/model/information.dart';

import 'package:vivu/services/http_services.dart';

import '../login.dart';

class Register4 extends ConsumerStatefulWidget {
  const Register4({super.key});

  @override
  ConsumerState<Register4> createState() => _Register4State();
}

class _Register4State extends ConsumerState<Register4> {
  Information? tempInfo;
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
          top: 150,
          left: 25,
          right: 15,
          child: Text(
            "Hãy viết một vài dòng giới thiệu bản thân nhé (*)",
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 200,
          left: 25,
          right: 15,
          child: TextFormField(
            controller: gioiThieuController,
          ),
        ),
        Positioned(
          top: 400,
          left: 25,
          right: 15,
          child: Container(
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 241, 78, 127),
            ),
            child: TextButton(
              onPressed: () async {
                if (gioiThieuController.text != "") {
                  tempInfo = Information(
                    ten: tenHienThiController.text,
                    gioiThieu: gioiThieuController.text,
                    soThich: soThichController.text,
                    truongHoc: truongHocController,
                    tinhTrang: tinhTrang,
                    noiSong: noiSongController.text,
                    tuoi: tuoiController.text,
                    facebook: facebookController.text,
                    cung: cungHoangDaoController,
                    doiTuong: doiTuongController,
                  );
                  updateCheckAcc(accountInstane?.id ??"");
                  for (var file in files) {
                    createImg(file);
                  }
                  print(tempInfo);
                  await createInfo(tempInfo!);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                  Fluttertoast.showToast(
                    msg: "Thông tin của bạn đã được cập nhật",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 20,
                  );
                  tenHienThiController.clear();
                  gioiThieuController.clear();
                  soThichController.clear();
                  noiSongController.clear();
                  facebookController.clear();
                  tuoiController.clear();
                  ref
                      .read(accountInstaneInfo.notifier)
                      .loadData("${accountInstane?.id}");
                }
              },
              child: Text(
                "Gửi thông tin",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
