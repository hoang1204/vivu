// To parse this JSON data, do
//
//     final imagelist = imagelistFromJson(jsonString);


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../services/http_services.dart';

part 'imagelist.freezed.dart';
part 'imagelist.g.dart';

List<Imagelist> imagelistFromJson(String str) =>
    List<Imagelist>.from(json.decode(str).map((x) => Imagelist.fromJson(x)));

String imagelistToJson(Imagelist data) => json.encode(data.toJson());

@freezed
class Imagelist with _$Imagelist {
  const factory Imagelist({
    String? id,
    String? idimg,
    String? name,
  }) = _Imagelist;

  factory Imagelist.fromJson(Map<String, dynamic> json) =>
      _$ImagelistFromJson(json);
}

class LoadImage extends StateNotifier<List<Imagelist>> {
  LoadImage(List<Imagelist>? state) : super(state ?? []);
  void loadData(String id) async {
    state = await getImgInfo(id);
    print(state);
  }
}
