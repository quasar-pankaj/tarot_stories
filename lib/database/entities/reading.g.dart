// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$ReadingImpl _$$$ReadingImplFromJson(Map<String, dynamic> json) =>
    _$$ReadingImpl(
      id: (json['id'] as num?)?.toInt(),
      journalId: (json['journalId'] as num).toInt(),
      readings: json['readings'] as String,
    );

Map<String, dynamic> _$$$ReadingImplToJson(_$$ReadingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'journalId': instance.journalId,
      'readings': instance.readings,
    };
