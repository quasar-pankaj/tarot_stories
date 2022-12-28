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
      cardOrdering:
          (json['cardOrdering'] as List<dynamic>).map((e) => e as int).toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => $enumDecode(_$SpreadCategoryEnumMap, e))
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
      'cardOrdering': instance.cardOrdering,
      'categories':
          instance.categories.map((e) => _$SpreadCategoryEnumMap[e]!).toList(),
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
  SpreadShape.pentagram: 'pentagram',
  SpreadShape.hexagram: 'hexagram',
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
  SpreadShape.triangle: 'triangle',
  SpreadShape.square: 'square',
};

const _$SpreadCategoryEnumMap = {
  SpreadCategory.character: 'character',
  SpreadCategory.sceneSequel: 'sceneSequel',
  SpreadCategory.location: 'location',
  SpreadCategory.prop: 'prop',
  SpreadCategory.structure: 'structure',
  SpreadCategory.relationship: 'relationship',
  SpreadCategory.all: 'all',
};
