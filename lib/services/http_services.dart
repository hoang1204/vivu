import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:vivu/model/account.dart';
import 'package:vivu/model/card_info.dart';
import 'package:vivu/model/imagelist.dart';
import 'package:vivu/model/information.dart';
import 'package:vivu/model/quan_info.dart';
import 'package:vivu/model/tag.dart';
import '../global.dart';

Future<bool> checkLogin(String user, String password) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/login.php");
  var response = await http.post(url, body: {
    "username": user,
    "password": password,
  });
  var data = json.decode(response.body);
  //print(data);
  if (data == "ok") {
    accountInstane = await getAccount(user);
    return true;
  } else
    return false;
}
// Future<bool> checkLogined() async {
//  final SharedPreferences prefs2 = await prefs;

// }

Future<Account> getAccount(String user) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/getAccount.php");
  var response = await http.post(url, body: {
    "username": user,
  });
  //var data = json.decode(response.body);
  var data = response.body;
  List<Account> temp = AccountFromJson(data);
  return temp[0];
}

Future<void> createInfo(Information info) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/createInfo.php");
  var response = await http.post(url, body: {
    "ID": accountInstane!.id,
    "Ten": info.ten,
    "SoThich": info.soThich,
    "GioiThieu": info.gioiThieu,
    "Cung": info.cung,
    "DoiTuong": info.doiTuong,
    "TruongHoc": info.truongHoc,
    "TinhTrang": info.tinhTrang,
    "NoiSong": info.noiSong,
    "Tuoi": info.tuoi,
    "Facebook": info.facebook
  });
  //var data = json.decode(response.body);
}

Future<bool> checkRegister(
    String user, String password, String repassword) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/register.php");
  var response = await http.post(url, body: {
    "username": user,
    "password": password,
  });
  var data = json.decode(response.body);
  // print(data);
  if (data == "DANG KI THANH CONG") {
    return true;
  } else
    return false;
}

Future<void> createImg(File file) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse("http://" + IP + "/vivu/account/createImg.php"));
  request.fields['ID'] = "${accountInstane?.id}";
  request.files.add(await http.MultipartFile.fromPath('file', file.path,
      contentType: MediaType('image', 'jpeg')));
  var response = await request.send();
}

// Future<void> createImgs(List<File> file) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('http://192.168.0.106/vivu/account/createImg.php'));
//   for (int i = 0; i < file.length; i++) {
//     request.files.add(await http.MultipartFile.fromPath('file', file[i].path,
//         contentType: MediaType('image', 'jpeg')));
//     var response = await request.send();
//   }
// }
Future<List<Information>> getDataInfo(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/loadInfo.php");
  var response = await http.post(url, body: {
    "ID": id,
  });
  //var data = json.decode(response.body);
  var data = response.body;
  // print(informationFromJson(data));
  return informationFromJson(data);
}

Future<List<Imagelist>> getImgInfo(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/loadImage.php");
  var response = await http.post(url, body: {
    "ID": id,
  });
  //var data = json.decode(response.body);
  var data = response.body;
//  print(imagelistFromJson(data));
  return imagelistFromJson(data);
}

Future<List<Imagelist>> getImgInfo2(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/loadImage.php");
  var response = await http.post(url, body: {
    "ID": id,
  });
  //var data = json.decode(response.body);
  var data = response.body;
  // print(imagelistFromJson(data));
  return imagelistFromJson(data);
}

Future<List<CardInfo>> getCardInfo(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/loadcardinfo.php");
  var response = await http.post(url, body: {
    "id": id,
  });
  //var data = json.decode(response.body);
  var data = response.body;
  print(cardInfoFromJson(data));
  return cardInfoFromJson(data);
}

Future<bool> updateCheckAcc(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/updatecheckacc.php");
  var response = await http.post(url, body: {
    "ID": id,
  });
  return true;
}

Future<List<Widget>> buildCard(List<CardInfo> card_info) async {
  List<Widget> result = [];
  List<Imagelist> img = [];
  for (int i = 0; i < card_info.length; i++) {
    img = await getImgInfo2("${card_info[i].id}");
    result.add(
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "http://" + IP + "/vivu/account/uploads/${img[0].name}"),
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
                print("chạm vào ảnh");
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1],
                  ),
                  borderRadius: BorderRadius.circular(10),
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
                  "${card_info[i].ten}" +
                      " (${card_info[i].tinhTrang == "1" ? "Độc thân" : "Hẹn hò"})",
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
                  "${card_info[i].truongHoc}",
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
                  "${card_info[i].gioiThieu}",
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
                  "tag: " + "${card_info[i].tag}",
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
    );
  }
  return result;
}

Future<List<CardInfo>> getCardLiked() async {
  var url = Uri.parse("http://" + IP + "/vivu/action/loadcardlike.php");
  var response = await http.post(url, body: {
    "ID": "${accountInstane?.id}",
  });
  //var data = json.decode(response.body);
  var data = response.body;
  // print(cardInfoFromJson(data));
  return cardInfoFromJson(data);
}

Future<void> swipeLeft(String iduserliked) async {
  var url = Uri.parse("http://" + IP + "/vivu/action/onswipeleft.php");
  var response = await http.post(url, body: {
    "ID": "${accountInstane?.id}",
    "IDuserliked": "${iduserliked}",
  });
  //var data = json.decode(response.body);
  var data = response.body;
}

Future<void> updateTag(String tag) async {
  var url = Uri.parse("http://" + IP + "/vivu/action/updatetags.php");
  var response = await http.post(url, body: {
    "ID": "${accountInstane?.id}",
    "tag": tag,
  });
  //var data = json.decode(response.body);
  var data = response.body;
}

Future<List<Account>> getAllAccount() async {
  var url = Uri.parse("http://" + IP + "/vivu/account/getAllAcount.php");
  var response = await http.post(url, body: {});
  var data = response.body;
  // print(AccountFromJson(data));
  return AccountFromJson(data);
}

Future<bool> deleteDataAccount(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/account/deleteAccount.php");
  var response = await http.post(url, body: {
    "ID": id,
  });
  //var data = json.decode(response.body);
  return true;
}

Future<void> createQuan(File file, String tenQuan, String diaChi) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse("http://" + IP + "/vivu/action/createquaninfo.php"));
  request.fields['tenQuan'] = tenQuan;
  request.fields['diaChi'] = diaChi;
  request.files.add(await http.MultipartFile.fromPath('file', file.path,
      contentType: MediaType('image', 'jpeg')));
  var response = await request.send();
  // print(response);
}

Future<List<QuanInfo>> getQuan() async {
  var url = Uri.parse("http://" + IP + "/vivu/action/loadquan.php");
  var response = await http.post(url, body: {});
  //var data = json.decode(response.body);
  var data = response.body;
  print(quanInfoFromJson(data));
  return quanInfoFromJson(data);
}

Future<List<Tag>> getTags() async {
  var url = Uri.parse("http://" + IP + "/vivu/action/loadtag.php");
  var response = await http.post(url, body: {});
  //var data = json.decode(response.body);
  var data = response.body;
  //print(tagFromJson(data));
  return tagFromJson(data);
}

Future<List<Tag>> getTags2() async {
  var url = Uri.parse("http://" + IP + "/vivu/action/loadtag2.php");
  var response = await http.post(url, body: {});
  //var data = json.decode(response.body);
  var data = response.body;
  //print(tagFromJson(data));
  return tagFromJson(data);
}

Future<bool> updateTag2(String id) async {
  var url = Uri.parse("http://" + IP + "/vivu/action/updatetag2.php");
  var response = await http.post(url, body: {
    "ID": id,
  });
  //var data = json.decode(response.body);
  return true;
}
