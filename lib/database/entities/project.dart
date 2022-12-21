import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    int? id,
    required String name,
    required String synopsis,
    required int createdTimestamp,
    required int modifiedTimestamp,
  }) = $Project;

  factory Project.fromJson(Map<String, Object?> json) =>
      _$ProjectFromJson(json);
}
