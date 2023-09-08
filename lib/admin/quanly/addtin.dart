import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivu/services/http_services.dart';

import '../../action/imagepicker.dart';
import '../../global.dart';

class AddTin extends ConsumerStatefulWidget {
  const AddTin({super.key});

  @override
  ConsumerState<AddTin> createState() => _AddTinQuanState();
}

class _AddTinQuanState extends ConsumerState<AddTin> {
  TextEditingController tenQuanController = TextEditingController();
  TextEditingController diaChiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration:
            BoxDecoration(color: cL, borderRadius: BorderRadius.circular(30)),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
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
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Thêm tin",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: SetPhotoScreen3(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: tenQuanController,
                    decoration: InputDecoration(
                      labelText: "Tên quán",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: diaChiController,
                    decoration: InputDecoration(
                      labelText: "Địa chỉ",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: cL,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          print(fileQuan);
                          print(tenQuanController.text);
                          print(diaChiController.text);
                          await createQuan(fileQuan!, tenQuanController.text,
                              diaChiController.text);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Xác nhận",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
