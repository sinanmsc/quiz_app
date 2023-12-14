import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/model/questions/question_model.dart';
import 'package:quiz_app/provider/quiz_provider.dart';
import 'package:quiz_app/view/home/home_page.dart';

class ResultPage extends ConsumerWidget {
  final List<Questions> allQuestions;
  const ResultPage({super.key, required this.allQuestions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF481450),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    Image.network(
                      'https://s3-alpha-sig.figma.com/img/0d0b/0589/f92419f24fac60a5f4c4cf74059dba12?Expires=1703462400&Signature=BCNHrNE5qe15hOe8c9sHSTha2h9vQDVYrJogXUXn8znWb~pHu2Revzf0EKB711RzsbEQSLlrXsnpP7~i~peNuJsIBi~hOYvnMHyBBIMEQJGhFB0H9rfVoP4pthFw8MgD097HAmmKXmDjW1k0IRyUP0RbFWkZOWzHQ5Lg-UjeTdQVqK0DXgnr4sOYpKkplGS2lTNyqOSaGq2YftmsmY6jQKSPwTWNHCXbwER-umPnWmwkKVUO7pxZinC-hhwCPakWxPP-z6HY32-4xFMrVwg5oPAto49EDTydisO5MKoQRRKjnNvQdoZBAUatfWh75bl6c1pei1FurjA3BN3uTbfDkg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                    ),
                    Text(
                      '${(((ref.watch(quizProvider).score) / allQuestions.length) * 100).round()}% Score',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Quiz Completed Successfully',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 18),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: [
                          const TextSpan(text: 'You attempt '),
                          TextSpan(
                              text: '${allQuestions.length} Questions ',
                              style: const TextStyle(color: Colors.red)),
                          const TextSpan(text: 'and from that '),
                          TextSpan(
                              text:
                                  '${ref.watch(quizProvider).score} answered ',
                              style: const TextStyle(color: Colors.green)),
                          const TextSpan(text: 'is correct.'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(Size(135, 45)),
                    backgroundColor: MaterialStatePropertyAll(
                        ref.watch(quizProvider).score == 5
                            ? Colors.green
                            : Colors.red)),
                onPressed: () {
                  ref.read(quizProvider.notifier).resetState();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                child: const Text(
                  'Try Again',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
