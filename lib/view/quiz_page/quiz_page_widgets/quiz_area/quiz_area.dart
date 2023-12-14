import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/questions/question_model.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/view/quiz_page/quiz_page_widgets/quiz_area/option_container.dart';
import 'package:quiz_app/view/result_page/result_page.dart';

class QuizArea extends ConsumerWidget {
  final Questions question;
  final List<Questions> allQuestiond;
  final int totalQuestions;
  final int currentQuestion;
  final void Function() onPressed;
  const QuizArea(
      {super.key,
      required this.question,
      required this.allQuestiond,
      required this.onPressed,
      required this.currentQuestion,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isOptionCorrect;

    return Column(
      children: [
        Text(question.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            )),
        const SizedBox(height: 30),
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemBuilder: (context, index) {
              final selectedIndex = ref.watch(quizProvider).optionIndexSelected;
              final isThisOptionSelected =
                  selectedIndex != null && selectedIndex == index;
              final isAnyOptionSelected = selectedIndex != null;
              isOptionCorrect =
                  ref.watch(quizProvider.notifier).isCorrect(question, index);

              var backgroundColor = Colors.transparent;
              if (isThisOptionSelected && isOptionCorrect ||
                  (selectedIndex != null &&
                      isOptionCorrect &&
                      isAnyOptionSelected)) {
                backgroundColor = Colors.green;
              } else if (isThisOptionSelected) {
                backgroundColor = Colors.red;
              }

              var borderColor = Colors.white;
              if (!isOptionCorrect &&
                  !isThisOptionSelected &&
                  isAnyOptionSelected) {
                borderColor = Colors.grey;
              }

              return InkWell(
                onTap: isAnyOptionSelected
                    ? null
                    : () {
                        ref
                            .read(quizProvider.notifier)
                            .selectOption(question, index);
                      },
                child: OptionContainer(
                    bgColor: backgroundColor,
                    borderColor: borderColor,
                    optionNo: 1 + index,
                    option: question.options[index].text),
              );
            },
            itemCount: 4,
          ),
        ),
        ref.watch(quizProvider).optionIndexSelected != null
            ? ElevatedButton(
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(135, 45)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  if (currentQuestion == totalQuestions - 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(allQuestions: allQuestiond),
                        ));
                  } else {
                    onPressed();
                  }
                },
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.black),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
