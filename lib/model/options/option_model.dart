import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

@freezed
class Options with _$Options {
  factory Options(
      { required String text,
      required bool isCorrect,
      @JsonKey(name: '_id')  required String id}) = _Options;

  factory Options.fromJson(Map<String, Object?> json) =>
      _$OptionsFromJson(json);
}

