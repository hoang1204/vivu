import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:vivu/model/account.dart';
import 'package:vivu/model/card_info.dart';
import 'package:vivu/model/imagelist.dart';
import 'package:vivu/model/information.dart';
import 'package:vivu/model/quan_info.dart';
import 'package:vivu/model/tag.dart';

import 'model/cardliked.dart';
import 'model/cardswipe2.dart';

Color cL = Color.fromARGB(255, 241, 78, 127);
String IP = "192.168.0.106";
Account? accountInstane = null;
final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

TextEditingController tenHienThiController = TextEditingController();
TextEditingController tuoiController = TextEditingController();
TextEditingController noiSongController = TextEditingController();
TextEditingController soThichController = TextEditingController();
TextEditingController facebookController = TextEditingController();
TextEditingController gioiThieuController = TextEditingController();
String truongHocController = "Đại học CNTT & TT (ICTU)";
String? gioiTinh;
String cungHoangDaoController = "Bạch Dương";
String? tinhTrang;
String doiTuongController = "Người yêu";
String tagsController = "Thư viện";
List<File> files = [];
File? fileQuan = null;
final accountInstaneInfo =
    StateNotifierProvider<LoadInformation, List<Information>>((_) {
  return LoadInformation(null);
});

final listAccounts = StateNotifierProvider<LoadAllAccount, List<Account>>((_) {
  return LoadAllAccount(null);
});
final listQuan =
    StateNotifierProvider<LoadQuanInformation, List<QuanInfo>>((_) {
  return LoadQuanInformation(null);
});
final accountInstaneImage =
    StateNotifierProvider<LoadImage, List<Imagelist>>((_) {
  return LoadImage(null);
});

final accountInfo =
    StateNotifierProvider<LoadInformation, List<Information>>((_) {
  return LoadInformation(null);
});

final accountImage = StateNotifierProvider<LoadImage, List<Imagelist>>((_) {
  return LoadImage(null);
});
final listCardInfo = StateNotifierProvider<LoadCardInfo, List<CardInfo>>((_) {
  return LoadCardInfo(null);
});
// List<Widget> cardSwipe = [];
final cardSwipe = StateProvider<List<Widget>>(
  (ref) => [],
);
final cardLiked = StateNotifierProvider<LoadCardLiked, List<CardInfo>>((_) {
  return LoadCardLiked(null);
});

final cardSwipe2 = StateNotifierProvider<LoadCardSwipe, List<Widget>>((ref) {
  return LoadCardSwipe(ref.watch(cardSwipe));
});

final listTags = StateNotifierProvider<LoadTag, List<Tag>>((_) {
  return LoadTag(null);
});
