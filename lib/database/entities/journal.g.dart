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
      shape: $enumDecode(_$SpreadShapeEnumMap, json['shape']),
    );

Map<String, dynamic> _$$$JournalToJson(_$$Journal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'query': instance.query,
      'createdTimestamp': instance.createdTimestamp,
      'modifiedTimestamp': instance.modifiedTimestamp,
      'elementId': instance.elementId,
      'shape': _$SpreadShapeEnumMap[instance.shape]!,
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
  SpreadShape.herosJourney12Circular: 'herosJourney12Circular',
  SpreadShape.herosJourney16Circular: 'herosJourney16Circular',
  SpreadShape.herosJourney12MByN: 'herosJourney12MByN',
  SpreadShape.herosJourney16MByN: 'herosJourney16MByN',
  SpreadShape.blakeSnyderBeatSheet: 'blakeSnyderBeatSheet',
  SpreadShape.threeDisasterFourAct: 'threeDisasterFourAct',
  SpreadShape.superStructure: 'superStructure',
  SpreadShape.fourteenPointStructure: 'fourteenPointStructure',
  SpreadShape.relationship2Way: 'relationship2Way',
  SpreadShape.relationship3Way: 'relationship3Way',
};
