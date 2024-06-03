// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      uid: json['uid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      team: json['team'] as String? ?? "",
      goal: json['goal'] as String? ?? "",
      assist: json['assist'] as String? ?? "",
      point: json['point'] as String? ?? "",
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'team': instance.team,
      'goal': instance.goal,
      'assist': instance.assist,
      'point': instance.point,
    };
