// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spread.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Spread _$$$SpreadFromJson(Map<String, dynamic> json) => _$$Spread(
      id: json['id'] as int?,
      name: json['name'] as String,
      createdTimestamp: json['createdTimestamp'] as int,
      modifiedTimestamp: json['modifiedTimestamp'] as int,
      projectId: json['projectId'] as int,
      layoutType: $enumDecode(_$LayoutTypeEnumMap, json['layoutType']),
      readings: (json['readings'] as List<dynamic>)
          .map((e) => Reading.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$$SpreadToJson(_$$Spread instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdTimestamp': instance.createdTimestamp,
      'modifiedTimestamp': instance.modifiedTimestamp,
      'projectId': instance.projectId,
      'layoutType': _$LayoutTypeEnumMap[instance.layoutType]!,
      'readings': instance.readings,
    };

const _$LayoutTypeEnumMap = {
  LayoutType.none: 'none',
  LayoutType.single: 'single',
  LayoutType.double: 'double',
  LayoutType.triple: 'triple',
  LayoutType.quad: 'quad',
  LayoutType.cross: 'cross',
  LayoutType.mByN: 'mByN',
  LayoutType.celticCross: 'celticCross',
  LayoutType.pentagram: 'pentagram',
  LayoutType.hexagram: 'hexagram',
  LayoutType.heptagram: 'heptagram',
  LayoutType.herosJourney12Circular: 'herosJourney12Circular',
  LayoutType.herosJourney16Circular: 'herosJourney16Circular',
  LayoutType.herosJourney12MByN: 'herosJourney12MByN',
  LayoutType.herosJourney16MByN: 'herosJourney16MByN',
  LayoutType.circularN: 'circularN',
  LayoutType.triangle: 'triangle',
  LayoutType.square: 'square',
};
