import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/service/api_service.dart';
import 'package:quiz_app/view/quiz_page/quiz_page_widgets/quiz_area/quiz_area.dart';
import 'package:quiz_app/view/quiz_page/quiz_page_widgets/timer_widget.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF481450),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 35,
            horizontal: 25,
          ),
          child: ref.watch(getDataProvider).when(
                data: (data) {
                  if (data == null) {
                    return const Center(child: Text('Somthing wrong'));
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 600,
                        child: PageView.builder(
                          controller: controller,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                TimerWidget(question: data[index]),
                                const SizedBox(height: 50),
                                QuizArea(
                                  allQuestiond: data,
                                  currentQuestion: index,
                                  totalQuestions: data.length,
                                  question: data[index],
                                  onPressed: () => ref
                                      .read(quizProvider.notifier)
                                      .openNextQuestion(controller, index),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) =>
                    Center(child: Text('error: $error')),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        ),
      ),
    );
  }
}
