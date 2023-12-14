import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/questions/question_model.dart';
import 'package:quiz_app/provider/quiz_provider.dart';

class TimerWidget extends ConsumerStatefulWidget {
  final Questions question;

  const TimerWidget({
    super.key,
    required this.question,
  });

  @override
  ConsumerState<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  @override
  void initState() {
    super.initState();

    ref.read(quizProvider.notifier).startTimer(widget.question);
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(quizProvider).timer;

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Transform.flip(
          flipX: true,
          child: LinearProgressIndicator(
            value: (60 - timer) / 60,
            minHeight: 30,
            borderRadius: BorderRadius.circular(30),
            backgroundColor: const Color(0xFF6C2677),
            color: timer < 10 ? Colors.red : const Color(0xFFC353D6),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            timer.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
