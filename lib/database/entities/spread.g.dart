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
      layoutType: $enumDecode(_$SpreadShapeEnumMap, json['layoutType']),
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
      'layoutType': _$SpreadShapeEnumMap[instance.layoutType]!,
      'readings': instance.readings,
    };

const _$SpreadShapeEnumMap = {
  SpreadShape.horiz1: 'horiz1',
  SpreadShape.horiz2: 'horiz2',
  SpreadShape.horiz3: 'horiz3',
  SpreadShape.horiz4: 'horiz4',
  SpreadShape.horiz5: 'horiz5',
  SpreadShape.vert2: 'vert2',
  SpreadShape.vert3: 'vert3',
  SpreadShape.vert4: 'vert4',
  SpreadShape.goalMotivationConflict: 'goalMotivationConflict',
  SpreadShape.goalConflictDisaster: 'goalConflictDisaster',
  SpreadShape.reactionDilemmaDecision: 'reactionDilemmaDecision',
  SpreadShape.actionReactionMovement: 'actionReactionMovement',
  SpreadShape.thesisAntithesisSynthesis: 'thesisAntithesisSynthesis',
  SpreadShape.fiveSenses: 'fiveSenses',
  SpreadShape.characterCross: 'characterCross',
  SpreadShape.backstory: 'backstory',
  SpreadShape.celticCross: 'celticCross',
  SpreadShape.cross4: 'cross4',
  SpreadShape.cross5: 'cross5',
  SpreadShape.cross6: 'cross6',
  SpreadShape.pentagram: 'pentagram',
  SpreadShape.hexagram: 'hexagram',
  SpreadShape.heptagram: 'heptagram',
  SpreadShape.herosJourney12Circular: 'herosJourney12Circular',
  SpreadShape.herosJourney16Circular: 'herosJourney16Circular',
  SpreadShape.herosJourney12MByN: 'herosJourney12MByN',
  SpreadShape.herosJourney16MByN: 'herosJourney16MByN',
  SpreadShape.blakeSnyderBeatSheet: 'blakeSnyderBeatSheet',
  SpreadShape.threeDisasterFourAct: 'threeDisasterFourAct',
  SpreadShape.superStructure: 'superStructure',
  SpreadShape.fourteenPointStructure: 'fourteenPointStructure',
  SpreadShape.freytagPyramid: 'freytagPyramid',
  SpreadShape.horseShoe: 'horseShoe',
  SpreadShape.relationship2Way: 'relationship2Way',
  SpreadShape.relationship3Way: 'relationship3Way',
  SpreadShape.relationship5Way: 'relationship5Way',
  SpreadShape.circularN: 'circularN',
  SpreadShape.triangle: 'triangle',
  SpreadShape.square: 'square',
};
