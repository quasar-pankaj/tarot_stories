// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Layout _$$$LayoutFromJson(Map<String, dynamic> json) => _$$Layout(
      id: json['id'] as int?,
      spreadId: json['spreadId'] as int,
      cards:
          (json['cards'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$$LayoutToJson(_$$Layout instance) => <String, dynamic>{
      'id': instance.id,
      'spreadId': instance.spreadId,
      'cards': instance.cards,
    };
