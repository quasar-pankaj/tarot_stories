// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$JournalImpl _$$$JournalImplFromJson(Map<String, dynamic> json) =>
    _$$JournalImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      query: json['query'] as String?,
      createdTimestamp: (json['createdTimestamp'] as num).toInt(),
      modifiedTimestamp: (json['modifiedTimestamp'] as num).toInt(),
      elementId: (json['elementId'] as num).toInt(),
      shape: $enumDecode(_$SpreadShapeEnumMap, json['shape']),
    );

Map<String, dynamic> _$$$JournalImplToJson(_$$JournalImpl instance) =>
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
  SpreadShape.threeDisasterFourAct: 'threeDisasterFourAct',
  SpreadShape.relationship2Way: 'relationship2Way',
  SpreadShape.relationship3Way: 'relationship3Way',
};
