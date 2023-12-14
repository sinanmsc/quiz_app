import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/model/questions/question_model.dart';
import 'package:quiz_app/provider/quiz_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.g.dart';

@riverpod
class Quiz extends _$Quiz {
  Timer? timer;

  @override
  QuizState build() {
    return QuizState(
      optionIndexSelected: null,
      score: 0,
      timer: 60,
    );
  }

  bool isCorrect(Questions question, int optionIndex) {
    return question.options[optionIndex].isCorrect;
  }

  void selectOption(Questions question, int optionIndex) {
    if (isCorrect(question, optionIndex)) {
      state = state.copyWith(score: state.score + 1);
    }
    state = state.copyWith(optionIndexSelected: optionIndex);
  }

  void openNextQuestion(PageController controller, int currentQuestionIndex) {
    controller.animateToPage(
      currentQuestionIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );

    state = state.copyWith(
      optionIndexSelected: null,
      timer: 60,
    );
  }

  void startTimer(Questions question) {
    stopTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timer == 0) {
        showCorrectAnswer(question);
      } else {
        state = state.copyWith(timer: state.timer - 1);
      }
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
    }
  }

  void showCorrectAnswer(Questions question) {
    stopTimer();

    for (int i = 0; i < question.options.length; i++) {
      if (question.options[i].isCorrect) {
        state = state.copyWith(optionIndexSelected: i);
        log('score: ${state.score}');
      }
    }
  }

  void resetState(){
    state = state.copyWith(optionIndexSelected: null,score: 0,timer: 60);
  }
}
