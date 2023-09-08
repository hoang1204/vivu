import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';
import 'package:vivu/model/card_info.dart';
import 'package:vivu/onclick/onclickcard.dart';

import '../../model/imagelist.dart';
import '../../services/http_services.dart';

class Likes extends ConsumerStatefulWidget {
  const Likes({Key? key}) : super(key: key);

  @override
  ConsumerState<Likes> createState() => _LikesState();
}

class _LikesState extends ConsumerState<Likes> {
  List<Imagelist> img = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
            width: 500,
          ),
          Column(
            children: [
              Center(
                child: Text(
                  "Cùng xem họ muốn đi đâu nào!",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ref.watch(cardLiked).length,
                  itemBuilder: (context, index) {
                    CardInfo item = ref.watch(cardLiked)[index];
                    return FutureBuilder<List<Imagelist>>(
                        future: getImgInfo2("${item.id}"),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Padding(
                                padding: EdgeInsets.all(5),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                18 /
                                                19,
                                        height: 500,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("http://" +
                                                IP +
                                                "/vivu/account/uploads/${snapshot.data![0].name}"),
                                            fit: BoxFit.cover,
                                          ),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                          //borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => OnclickCard(
                                                        int.parse(
                                                            item.id ?? "0"))));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                stops: [0.7, 1],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 15,
                                        bottom: 80,
                                        child: Row(
                                          children: [
                                            Text(
                                              "${item.ten}" +
                                                  " (${item.tinhTrang == "1" ? "Độc thân" : "Hẹn hò"})",
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 15,
                                        bottom: 60,
                                        child: Row(
                                          children: [
                                            Text(
                                              "${item.truongHoc}",
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 15,
                                        bottom: 40,
                                        child: Row(
                                          children: [
                                            Text(
                                              "${item.gioiThieu}",
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 15,
                                        bottom: 20,
                                        child: Row(
                                          children: [
                                            Text(
                                              "tag: " + "${item.tag}",
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          } else {
                            return ListTile(
                              leading: CircularProgressIndicator(),
                            );
                          }
                        });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
