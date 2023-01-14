// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Spread _$$$SpreadFromJson(Map<String, dynamic> json) => _$$Spread(
      id: json['id'] as int?,
      journalId: json['journalId'] as int,
      cards: (json['cards'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$$SpreadToJson(_$$Spread instance) => <String, dynamic>{
      'id': instance.id,
      'journalId': instance.journalId,
      'cards': instance.cards,
    };
