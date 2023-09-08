// To parse this JSON data, do
//
//     final tag = tagFromJson(jsonString);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../services/http_services.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

List<Tag> tagFromJson(String str) =>
    List<Tag>.from(json.decode(str).map((x) => Tag.fromJson(x)));

String tagToJson(Tag data) => json.encode(data.toJson());

@freezed
class Tag with _$Tag {
  const factory Tag({
    String? idduyettag,
    String? account,
    String? nametag,
    String? tinhtrang,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

class LoadTag extends StateNotifier<List<Tag>> {
  LoadTag(List<Tag>? state) : super(state ?? []);
  void loadData() async {
    state = await getTags();
    print(state);
  }

  void loadData2() async {
    state = await getTags2();
    print(state);
  }

  void delAccount(Tag tag) {
    state = state.where((info) => info.idduyettag != tag.idduyettag).toList();
  }
}
