import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivu/global.dart';
import 'package:vivu/model/tag.dart';
import 'package:vivu/services/http_services.dart';

class DuyetTag extends ConsumerStatefulWidget {
  const DuyetTag({super.key});

  @override
  ConsumerState<DuyetTag> createState() => _DuyetTagState();
}

class _DuyetTagState extends ConsumerState<DuyetTag> {
  TextEditingController tenQuanController = TextEditingController();
  TextEditingController diaChiController = TextEditingController();
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
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
            width: 500,
          ),
          Positioned(
            left: 140,
            top: 60,
            child: Text(
              "Duyệt tag",
              style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("ID"),
                  SizedBox(
                    width: 50,
                  ),
                  Text("User đề xuất"),
                  SizedBox(
                    width: 80,
                  ),
                  Text("Tên tag"),
                  //  TextButton(onPressed: () {}, child: Text("Duyệt")),
                  //       TextButton(onPressed: () {}, child: Text("Bỏ"))
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 200,
            child: ListView.builder(
              itemCount: ref.watch(listTags).length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(ref.watch(listTags)[index].idduyettag ?? ""),
                      SizedBox(
                        width: 50,
                      ),
                      Text(ref.watch(listTags)[index].account ?? ""),
                      SizedBox(
                        width: 80,
                      ),
                      Text(ref.watch(listTags)[index].nametag ?? ""),
                      TextButton(
                        onPressed: () async {
                          await updateTag2(
                              ref.read(listTags)[index].idduyettag ?? "");
                          Tag temp = ref.read(listTags)[index];
                          ref.read(listTags.notifier).delAccount(temp);
                        },
                        child: Text("Duyệt"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
