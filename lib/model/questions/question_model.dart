import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/model/options/option_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class Questions with _$Questions {
  factory Questions(
      {@JsonKey(name: '_id') required String id,
      required String question,
      required List<Options> options}) = _Questions;

  factory Questions.fromJson(Map<String, Object?> json) =>
      _$QuestionsFromJson(json);
}
