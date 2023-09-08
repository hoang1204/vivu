// To parse this JSON data, do
//
//     final account = accountFromJson(jsonString);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../services/http_services.dart';

part 'account.freezed.dart';
part 'account.g.dart';

List<Account> AccountFromJson(String str) =>
    List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));
Account accountFromJson(String str) => Account.fromJson(json.decode(str));

String accountToJson(Account data) => json.encode(data.toJson());

@freezed
class Account with _$Account {
  const factory Account({
    String? id,
    String? account,
    String? password,
    String? checkAcc,
    String? chucVu,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

class LoadAllAccount extends StateNotifier<List<Account>> {
  LoadAllAccount(List<Account>? state) : super(state ?? []);
  void loadData() async {
    state = await getAllAccount();
    print(state);
  }

  void delAccount(Account) {
    state = state.where((info) => info.id != Account.id).toList();
  }
}
