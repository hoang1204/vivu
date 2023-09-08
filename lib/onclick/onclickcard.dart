import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';

import 'image2.dart';
import 'infomation2.dart';

class OnclickCard extends ConsumerStatefulWidget {
  final int index;
  const OnclickCard(this.index, {super.key});

  @override
  ConsumerState<OnclickCard> createState() => _OnclickCardState();
}

class _OnclickCardState extends ConsumerState<OnclickCard> {
  var idx = 0;
  List<Widget> _profile = [
    ThongTin2(),
    Anh2(),
  ];
  double sz2 = 10;
  double sz = 30;
  @override
  void initState() {
    ref.read(accountInfo.notifier).loadData("${widget.index}");
    ref.read(accountImage.notifier).loadData("${widget.index}");
    super.initState();
  }

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
      body: Stack(
        children: [
          Positioned(
            top: 160,
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
            top: sz,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 57,
              child: TextButton(
                onPressed: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage("http://" +
                      IP +
                      "/vivu/account/uploads/${ref.watch(accountImage)[0].name}"),
                  radius: 55,
                ),
              ),
            ),
          ),
          Positioned(
            top: sz + 130,
            left: 10,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      ref.watch(accountInfo)[0].ten ?? "",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                        "(${ref.watch(accountInfo)[0].tinhTrang == "1" ? "Độc thân" : "Hẹn hò"})")
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 220,
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
                          color: Color.fromARGB(255, 219, 218, 218), width: 2)),
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
                          color: Color.fromARGB(255, 219, 218, 218), width: 2)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ref.watch(accountInfo)[0].luotFollow ?? "1",
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
                          color: Color.fromARGB(255, 219, 218, 218), width: 2)),
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
            top: 310,
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
            top: 310,
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
            top: 360,
            child: _profile[idx],
          ),
        ],
      ),
    );
  }
}
