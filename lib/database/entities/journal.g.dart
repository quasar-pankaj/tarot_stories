// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Journal _$$$JournalFromJson(Map<String, dynamic> json) => _$$Journal(
      id: json['id'] as int?,
      name: json['name'] as String,
      query: json['query'] as String?,
      createdTimestamp: json['createdTimestamp'] as int,
      modifiedTimestamp: json['modifiedTimestamp'] as int,
      elementId: json['elementId'] as int,
    );

Map<String, dynamic> _$$$JournalToJson(_$$Journal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'query': instance.query,
      'createdTimestamp': instance.createdTimestamp,
      'modifiedTimestamp': instance.modifiedTimestamp,
      'elementId': instance.elementId,
    };
