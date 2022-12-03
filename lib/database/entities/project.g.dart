// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Project _$$$ProjectFromJson(Map<String, dynamic> json) => _$$Project(
      id: json['id'] as int?,
      name: json['name'] as String,
      synopsis: json['synopsis'] as String,
      createdTimestamp: json['createdTimestamp'] as int,
      modifiedTimestamp: json['modifiedTimestamp'] as int,
    );

Map<String, dynamic> _$$$ProjectToJson(_$$Project instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'synopsis': instance.synopsis,
      'createdTimestamp': instance.createdTimestamp,
      'modifiedTimestamp': instance.modifiedTimestamp,
    };
