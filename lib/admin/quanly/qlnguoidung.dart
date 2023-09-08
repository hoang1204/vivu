import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vivu/pages/register.dart';

import '../../global.dart';
import '../../services/http_services.dart';

class QuanLyNguoiDung extends ConsumerStatefulWidget {
  const QuanLyNguoiDung({super.key});

  @override
  ConsumerState<QuanLyNguoiDung> createState() => _QuanLyNguoiDungState();
}

class _QuanLyNguoiDungState extends ConsumerState<QuanLyNguoiDung> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        automaticallyImplyLeading: false,
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
              TextButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterPage()));
                },
                icon: Icon(Icons.add),
                label: Text("Add user"),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ref.watch(listAccounts).length,
                  itemBuilder: ((context, index) {
                    final item = ref.watch(listAccounts)[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username: ${item.account}"),
                              Text("Password: ${item.password}"),
                            ],
                          ),
                          onTap: () {},
                          trailing: IconButton(
                              onPressed: () {
                                if (item.id == "1") {
                                  Fluttertoast.showToast(
                                    msg: "Can't delete admin account",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20,
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Delete successful",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blue,
                                    textColor: Colors.white,
                                    fontSize: 20,
                                  );
                                  deleteDataAccount(item.id ?? '');
                                  ref
                                      .read(listAccounts.notifier)
                                      .delAccount(item);
                                }
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ),
                    );
                  })),
            ],
          )),
        ],
      ),
    );
  }
}
