// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$ElementImpl _$$$ElementImplFromJson(Map<String, dynamic> json) =>
    _$$ElementImpl(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num).toInt(),
      name: json['name'] as String,
      synopsis: json['synopsis'] as String?,
      elementType: $enumDecode(_$JournalCategoryEnumMap, json['elementType']),
    );

Map<String, dynamic> _$$$ElementImplToJson(_$$ElementImpl instance) =>
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
