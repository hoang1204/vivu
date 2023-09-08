import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';
import 'package:vivu/pages/bottomPage/profile/image.dart';
import 'package:vivu/pages/bottomPage/profile/infomation.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  var idx = 0;
  List<Widget> _profile = [
    ThongTin(),
    Anh(),
  ];
  double sz2 = 100;
  double sz = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1000,
            ),
            Positioned(
              top: 260,
              right: 30,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 241, 78, 127),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Nhắn tin",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: TextButton(
                onPressed: () {},
                child: Image.network(
                  "http://" +
                      IP +
                      "/vivu/account/uploads/${ref.watch(accountInstaneImage)[0].name}",
                  width: MediaQuery.of(context).size.width - 15,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                child: TextButton(
                  onPressed: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("http://" +
                        IP +
                        "/vivu/account/uploads/${ref.watch(accountInstaneImage)[0].name}"),
                    radius: 55,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130 + 130,
              left: 10,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        ref.watch(accountInstaneInfo)[0].ten ?? "",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                          "(${ref.watch(accountInstaneInfo)[0].tinhTrang == "1" ? "Độc thân" : "Hẹn hò"})")
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              left: 10,
              child: Row(
                children: [
                  Container(
                    width: 115,
                    height: 80,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 219, 218, 218),
                            width: 2)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${ref.watch(cardLiked).length}",
                            style: GoogleFonts.acme(
                                color: Color.fromARGB(255, 241, 78, 127),
                                fontSize: 18),
                          ),
                          Text("Liked"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 115,
                    height: 80,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 219, 218, 218),
                            width: 2)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ref.watch(accountInstaneInfo)[0].luotFollow ?? "1",
                            style: GoogleFonts.acme(
                              color: Color.fromARGB(255, 241, 78, 127),
                              fontSize: 18,
                            ),
                          ),
                          Text("Like"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 115,
                    height: 80,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 219, 218, 218),
                            width: 2)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1000",
                            style: GoogleFonts.acme(
                              color: Color.fromARGB(255, 241, 78, 127),
                              fontSize: 18,
                            ),
                          ),
                          Text("Contacts"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 410,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 241, 78, 127),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      idx = 0;
                      print(idx);
                    });
                  },
                  child: Text(
                    "Thông tin",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 410,
              left: MediaQuery.of(context).size.width / 2,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 241, 78, 127),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      idx = 1;
                      print(idx);
                    });
                  },
                  child: Text(
                    "Ảnh",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 460,
              child: _profile[idx],
            ),
          ],
        ),
      ),
    );
  }
}
