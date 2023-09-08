import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vivu/pages/login.dart';
import 'package:vivu/services/http_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userRegisterController = TextEditingController();
  TextEditingController passRegisterController = TextEditingController();
  TextEditingController rePassRegisterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 238, 182, 194), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 1],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/cloud1.png",
              width: 390,
            ),
          ),
          Positioned(
            bottom: 160,
            child: Image.asset(
              "assets/images/cloud2.jpg",
              width: 100,
            ),
          ),
          Positioned(
            bottom: 140,
            right: 0,
            child: Image.asset(
              "assets/images/cloud3.jpg",
              width: 100,
            ),
          ),
          Positioned(
            child: Image.asset("assets/images/name.png"),
          ),
          Positioned(
            top: 70,
            left: 40,
            child: Image.asset(
              "assets/images/icon.png",
              width: 80,
            ),
          ),
          Center(
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    width: 360,
                    height: 460,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Đăng ký tài khoản",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 90, 70, 70),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 320,
                      child: TextField(
                        controller: userRegisterController,
                        decoration: InputDecoration(
                          label: Row(
                            children: [
                              Icon(Icons.person_pin_outlined),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Tên đăng nhập"),
                            ],
                          ),
                        ),
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
                      width: 30,
                    ),
                    Container(
                      width: 320,
                      child: TextField(
                        controller: passRegisterController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Mật khẩu"),
                            ],
                          ),
                        ),
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
                      width: 30,
                    ),
                    Container(
                      width: 320,
                      child: TextField(
                        controller: rePassRegisterController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: Row(
                            children: [
                              Icon(Icons.lock_reset),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Nhập lại mật khẩu"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (rePassRegisterController.text !=
                          passRegisterController.text) {
                        Fluttertoast.showToast(
                          msg: "Nhập sai password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20,
                        );
                        resetController();
                      } else if (passRegisterController.text.length < 8) {
                        Fluttertoast.showToast(
                          msg: "Mật khẩu phải có tối thiểu 8 kí tự!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20,
                        );
                        resetController();
                      } else if (await checkRegister(
                              userRegisterController.text,
                              passRegisterController.text,
                              rePassRegisterController.text) ==
                          false) {
                        Fluttertoast.showToast(
                          msg: "Tài khoản đã tồn tại!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20,
                        );
                        resetController();
                      } else {
                        Fluttertoast.showToast(
                          msg: "Đăng ký thành công !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20,
                        );
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      }
                    },
                    child: Text(
                      "Đăng ký",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("*   Mật khẩu phải có tối thiểu 8 kí tự!"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void resetController() {
    rePassRegisterController.clear();
    passRegisterController.clear();
    userRegisterController.clear();
  }
}
