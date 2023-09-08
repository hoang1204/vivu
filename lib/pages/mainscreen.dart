import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';
import 'package:vivu/pages/login.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    accountInstane = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tenHienThiController.clear();
    tuoiController.clear();
    noiSongController.clear();
    return Scaffold(
      body: Stack(
        children: [
          // Positioned(
          //   child: Image.network(
          //       'http://192.168.0.103/pttk/pttk/admincp/modules/quanlysp/uploads/FIGURE-137640.jpg'),
          // ),
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
            width: 500,
          ),
          Positioned(
            bottom: 140,
            right: 0,
            child: Image.asset(
              "assets/images/ballon.png",
              width: 130,
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            child: Image.asset(
              "assets/images/ballon.png",
              width: 100,
            ),
          ),
          Positioned(
            top: 340,
            right: 50,
            child: Image.asset(
              "assets/images/cloud3.jpg",
              width: 140,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Image.asset(
                  "assets/images/name.png",
                  width: 300,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "The best place to meet souls",
                style: GoogleFonts.acme(fontWeight: FontWeight.bold),
              ),
              Text(
                "Meet your soulmate here",
                style: GoogleFonts.acme(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 100,
                    child: TextButton(
                      //  color: Colors.pink,
                      onPressed: () {
                        //ref.read(listCardInfo.notifier).loadData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginPage())));
                      },
                      child: Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 78, 127),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Bắt đầu",
                            style: GoogleFonts.acme(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
