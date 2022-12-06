// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Reading _$$$ReadingFromJson(Map<String, dynamic> json) => _$$Reading(
      cardId: json['cardId'] as String,
      context:
          PositionTemplate.fromJson(json['context'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$$ReadingToJson(_$$Reading instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'context': instance.context,
      'text': instance.text,
    };
