// To parse this JSON data, do
//
//     final quanInfo = quanInfoFromJson(jsonString);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../services/http_services.dart';

part 'quan_info.freezed.dart';
part 'quan_info.g.dart';

List<QuanInfo> quanInfoFromJson(String str) =>
    List<QuanInfo>.from(json.decode(str).map((x) => QuanInfo.fromJson(x)));

String quanInfoToJson(QuanInfo data) => json.encode(data.toJson());

@freezed
class QuanInfo with _$QuanInfo {
  const factory QuanInfo({
    String? iDquan,
    String? ten,
    String? diachi,
    String? gioithieu,
    String? image,
  }) = _QuanInfo;

  factory QuanInfo.fromJson(Map<String, dynamic> json) =>
      _$QuanInfoFromJson(json);
}

class LoadQuanInformation extends StateNotifier<List<QuanInfo>> {
  LoadQuanInformation(List<QuanInfo>? state) : super(state ?? []);
  void loadData() async {
    state = await getQuan();
    print(state);
  }
}
