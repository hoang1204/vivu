import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vivu/admin/quanly/addtin.dart';

import '../../global.dart';

class DangTinQuan extends ConsumerStatefulWidget {
  const DangTinQuan({super.key});

  @override
  ConsumerState<DangTinQuan> createState() => _DangTinQuanState();
}

class _DangTinQuanState extends ConsumerState<DangTinQuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration:
            BoxDecoration(color: cL, borderRadius: BorderRadius.circular(30)),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddTin()));
          },
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Quản lý đăng tin",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: ref.watch(listQuan).length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width:
                                      MediaQuery.of(context).size.width * 1 / 2,
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
                                  left: MediaQuery.of(context).size.width *
                                          1 /
                                          2 +
                                      5,
                                  right: 0,
                                  child: Text(
                                      ref.watch(listQuan)[index].ten ?? ""),
                                ),
                                Positioned(
                                  top: 60,
                                  left: MediaQuery.of(context).size.width *
                                          1 /
                                          2 +
                                      5,
                                  right: 0,
                                  child: Text(
                                      ref.watch(listQuan)[index].diachi ?? ""),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    print("Suar");
                                  },
                                  icon: Icon(
                                    Icons.change_circle,
                                    color: cL,
                                  )),
                              IconButton(
                                onPressed: () {
                                  print("delete");
                                },
                                icon: Icon(Icons.delete),
                                color: cL,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
