import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout.freezed.dart';
part 'layout.g.dart';

@freezed
class Layout with _$Layout {
  factory Layout({
    int? id,
    required int spreadId,
    List<String>? cards,
  }) = $Layout;

  factory Layout.fromJson(Map<String, Object?> json) => _$LayoutFromJson(json);
}
