// To parse this JSON data, do
//
//     final cardInfo = cardInfoFromJson(jsonString);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../services/http_services.dart';

part 'card_info.freezed.dart';
part 'card_info.g.dart';

List<CardInfo> cardInfoFromJson(String str) =>
    List<CardInfo>.from(json.decode(str).map((x) => CardInfo.fromJson(x)));

String cardInfoToJson(CardInfo data) => json.encode(data.toJson());

@freezed
class CardInfo with _$CardInfo {
  const factory CardInfo({
    String? id,
    String? ten,
    String? tinhTrang,
    String? gioiThieu,
    String? tag,
    String? truongHoc,
  }) = _CardInfo;

  factory CardInfo.fromJson(Map<String, dynamic> json) =>
      _$CardInfoFromJson(json);
}

class LoadCardInfo extends StateNotifier<List<CardInfo>> {
  LoadCardInfo(List<CardInfo>? state) : super(state ?? []);
  void loadData(String id) async {
    state = await getCardInfo(id);
    print(state);
  }
}
