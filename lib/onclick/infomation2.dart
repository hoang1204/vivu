import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';

class ThongTin2 extends ConsumerStatefulWidget {
  const ThongTin2({super.key});

  @override
  ConsumerState<ThongTin2> createState() => _ThongTin2State();
}

class _ThongTin2State extends ConsumerState<ThongTin2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 500,
            width: 800,
            color: Color.fromARGB(255, 243, 240, 240),
          ),
          Positioned(
            top: 25,
            left: 10,
            child: Text(
              "GIỚI THIỆU BẢN THÂN",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 9),
                child: Text(
                  ref.watch(accountInfo)[0].gioiThieu ?? "",
                ),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 10,
            child: Text(
              "Sở thích",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 110 + 24,
            child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 9),
                child: Text(
                  ref.watch(accountInfo)[0].soThich ?? "",
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 10,
            child: Text(
              "Cung hoàng đạo",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 190 + 24,
            child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 9),
                child: Text(
                  ref.watch(accountInfo)[0].cung ?? "",
                ),
              ),
            ),
          ),
          Positioned(
            top: 275,
            left: 10,
            child: Text(
              "Đối tượng tìm kiếm",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 275 + 24,
            child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 9),
                child: Text(
                  ref.watch(accountInfo)[0].doiTuong ?? "",
                ),
              ),
            ),
          ),
          Positioned(
            top: 360,
            left: 10,
            child: Text(
              "Bạn đang học tại",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 360 + 24,
            child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 9),
                child: Text(
                  ref.watch(accountInfo)[0].truongHoc ?? "",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
