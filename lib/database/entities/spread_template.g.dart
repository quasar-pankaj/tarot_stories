// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spread_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$SpreadTemplate _$$$SpreadTemplateFromJson(Map<String, dynamic> json) =>
    _$$SpreadTemplate(
      id: json['id'] as int?,
      name: json['name'] as String,
      numCards: json['numCards'] as int,
      shape: $enumDecode(_$SpreadShapeEnumMap, json['shape']),
      positions: (json['positions'] as List<dynamic>)
          .map((e) => PositionTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      readings: (json['readings'] as List<dynamic>)
          .map((e) => Reading.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$$SpreadTemplateToJson(_$$SpreadTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numCards': instance.numCards,
      'shape': _$SpreadShapeEnumMap[instance.shape]!,
      'positions': instance.positions,
      'readings': instance.readings,
    };

const _$SpreadShapeEnumMap = {
  SpreadShape.horiz1: 'horiz1',
  SpreadShape.horiz2: 'horiz2',
  SpreadShape.horiz3: 'horiz3',
  SpreadShape.horiz4: 'horiz4',
  SpreadShape.horiz5: 'horiz5',
  SpreadShape.vert1: 'vert1',
  SpreadShape.vert2: 'vert2',
  SpreadShape.vert3: 'vert3',
  SpreadShape.vert4: 'vert4',
  SpreadShape.vert5: 'vert5',
  SpreadShape.celticCross: 'celticCross',
  SpreadShape.ankh: 'ankh',
  SpreadShape.cross4: 'cross4',
  SpreadShape.cross5: 'cross5',
  SpreadShape.pentagram: 'pentagram',
  SpreadShape.hexagram: 'hexagram',
  SpreadShape.heptagram: 'heptagram',
  SpreadShape.herosJourney12Circular: 'herosJourney12Circular',
  SpreadShape.herosJourney16Circular: 'herosJourney16Circular',
  SpreadShape.herosJourney12MByN: 'herosJourney12MByN',
  SpreadShape.herosJourney16MByN: 'herosJourney16MByN',
  SpreadShape.relationship3Way: 'relationship3Way',
  SpreadShape.relationship5Way: 'relationship5Way',
  SpreadShape.circularN: 'circularN',
  SpreadShape.triangle: 'triangle',
  SpreadShape.square: 'square',
};
