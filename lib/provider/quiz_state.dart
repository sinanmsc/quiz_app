import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  factory QuizState({
    int? optionIndexSelected,
    required int score,
    required int timer,
  }) = _QuizState;
}
