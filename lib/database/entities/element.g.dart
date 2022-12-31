// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$Element _$$$ElementFromJson(Map<String, dynamic> json) => _$$Element(
      id: json['id'] as int?,
      projectId: json['projectId'] as int,
      name: json['name'] as String,
      synopsis: json['synopsis'] as String?,
      elementType: $enumDecode(_$JournalCategoryEnumMap, json['elementType']),
    );

Map<String, dynamic> _$$$ElementToJson(_$$Element instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'name': instance.name,
      'synopsis': instance.synopsis,
      'elementType': _$JournalCategoryEnumMap[instance.elementType]!,
    };

const _$JournalCategoryEnumMap = {
  JournalCategory.character: 'character',
  JournalCategory.sceneSequel: 'sceneSequel',
  JournalCategory.location: 'location',
  JournalCategory.prop: 'prop',
  JournalCategory.structure: 'structure',
  JournalCategory.relationship: 'relationship',
};
