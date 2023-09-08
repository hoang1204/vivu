// To parse this JSON data, do
//
//     final information = informationFromJson(jsonString);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
import '../services/http_services.dart';

part 'information.freezed.dart';
part 'information.g.dart';

List<Information> informationFromJson(String str) => List<Information>.from(
    json.decode(str).map((x) => Information.fromJson(x)));

String informationToJson(Information data) => json.encode(data.toJson());

@freezed
class Information with _$Information {
  const factory Information({
    String? id,
    String? ten,
    String? luotLike,
    String? luotFollow,
    String? soThich,
    String? gioiThieu,
    String? cung,
    String? doiTuong,
    String? truongHoc,
    String? tinhTrang,
    String? noiSong,
    String? tuoi,
    String? facebook,
  }) = _Information;

  factory Information.fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);
}

class LoadInformation extends StateNotifier<List<Information>> {
  LoadInformation(List<Information>? state) : super(state ?? []);
  void loadData(String id) async {
    state = await getDataInfo(id);
    print(state);
  }
}
