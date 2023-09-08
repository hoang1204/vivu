import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/services/http_services.dart';

import '../../global.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  // final tags = [
  //   "Cafe",
  //   "Vincom",
  //   "TTTM GO",
  //   "Sky Pub",
  //   "Thư viện",
  //   "Khác",
  // ];
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
          Positioned(
            top: 90,
            left: 45,
            child: Text(
              "Hôm nay bạn muốn đi đâuu?",
              style: GoogleFonts.aBeeZee(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 180,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Chọn địa điểm muốn đi nhé",
                  border: OutlineInputBorder(),
                ),
                value: tagsController,
                items: ref
                    .watch(listTags)
                    .map(
                      (e) => DropdownMenuItem(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(e.nametag ?? ""),
                          ],
                        ),
                        value: e.nametag,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    tagsController = value as String;
                    print(tagsController);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  color: cL,
                ),
                child: TextButton(
                  onPressed: () async {
                    await updateTag(tagsController);

                    ref.read(cardSwipe.notifier).state =
                        await buildCard(ref.read(listCardInfo));

                    /// ref.read(cardSwipe2.notifier).loadData();
                    Fluttertoast.showToast(
                      msg: "Cập nhật tag thành công!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 20,
                    );
                  },
                  child: Text(
                    "Xác nhận",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Gợi ý",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 360,
              child: ListView.builder(
                itemCount: ref.watch(listQuan).length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Stack(
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width * 1 / 2,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Image.network(
                                "http://" +
                                    IP +
                                    "/vivu/account/uploads/${ref.watch(listQuan)[index].image}",
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              left:
                                  MediaQuery.of(context).size.width * 1 / 2 + 5,
                              right: 0,
                              child: Text(ref.watch(listQuan)[index].ten ?? ""),
                            ),
                            Positioned(
                              top: 60,
                              left:
                                  MediaQuery.of(context).size.width * 1 / 2 + 5,
                              right: 0,
                              child:
                                  Text(ref.watch(listQuan)[index].diachi ?? ""),
                            )
                          ],
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width - 10,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
