// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String?,
      account: json['account'] as String?,
      password: json['password'] as String?,
      checkAcc: json['checkAcc'] as String?,
      chucVu: json['chucVu'] as String?,
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'password': instance.password,
      'checkAcc': instance.checkAcc,
      'chucVu': instance.chucVu,
    };
