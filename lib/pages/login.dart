import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vivu/global.dart';
import 'package:vivu/pages/homepage.dart';
import 'package:vivu/pages/register.dart';
import 'package:vivu/pages/registerpage.dart';

import '../admin/adminmainpage.dart';
import '../services/http_services.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    accountInstane = null;
    super.initState();
  }

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/login.jpg",
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 210,
                  ),
                  Text(
                    "The best place to meet souls",
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Meet your soulmate here",
                    style: GoogleFonts.acme(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 305,
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    Icon(Icons.admin_panel_settings),
                    Text(
                      "Tên đăng nhập",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: userController,
                        decoration: InputDecoration(
                          label: Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              //   Text("Email"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Row(
                  children: [
                    SizedBox(width: 50),
                    Icon(Icons.lock),
                    Text(
                      "Mật khẩu",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: passController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              // Text("Mật khẩu"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 240,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Quên mật khẩu",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 222,
                    ),
                    TextButton(
                      onPressed: () async {
                        // print("http://192.168.0.106/vivu/account/register.php");
                        if (await checkLogin(
                            userController.text, passController.text)) {
                          final SharedPreferences prefs2 = await prefs;
                          prefs2.setString(
                              "accountInstance", userController.text);
                          if (accountInstane?.chucVu == "1") {
                            // ref.read(listQuan.notifier).loadData();
                            // ref.read(listTags.notifier).loadData2();
                            // ref.read(listAccounts.notifier).loadData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AdminMainPage()));
                          } else if (accountInstane?.checkAcc == "0") {
                            Fluttertoast.showToast(
                              msg:
                                  "Hãy hoàn tất nhập liệu thông tin cho lần đầu đăng nhập",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20,
                            );
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => Register()));
                          } else {
                            //  ref.read(cardLiked.notifier).loadData();
                            // ref.read(listQuan.notifier).loadData();
                            ref
                                .read(listCardInfo.notifier)
                                .loadData(accountInstane!.id ?? "");
                            ref.read(cardSwipe.notifier).state =
                                await buildCard(ref.read(listCardInfo));
                            // print("${ref.read(cardSwipe).length}" + "lenghne");
                            // ref.read(cardSwipe2);
                            Fluttertoast.showToast(
                              msg: "Đăng nhập thành công!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20,
                            );

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                          }
                          print(accountInstane);
                        } else {
                          Fluttertoast.showToast(
                            msg: "Sai tên đăng nhập hoặc mật khẩu",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                          );
                        }
                      },
                      child: Text("Đăng nhập",
                          style: GoogleFonts.actor(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bạn chưa có tài khoản?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => RegisterPage())));
                      },
                      child: Text("Đăng ký"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
