// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$ProjectImpl _$$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$$ProjectImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      synopsis: json['synopsis'] as String,
      createdTimestamp: (json['createdTimestamp'] as num).toInt(),
      modifiedTimestamp: (json['modifiedTimestamp'] as num).toInt(),
    );

Map<String, dynamic> _$$$ProjectImplToJson(_$$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'synopsis': instance.synopsis,
      'createdTimestamp': instance.createdTimestamp,
      'modifiedTimestamp': instance.modifiedTimestamp,
    };
