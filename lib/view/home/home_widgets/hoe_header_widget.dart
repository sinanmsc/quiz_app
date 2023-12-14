import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/pngtree-quiz-time-speech-bubble-isolated-design-png-image_6579430 1.png',
        ),
        ElevatedButton(
          style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size(135, 45)),
              backgroundColor: MaterialStatePropertyAll(Color(0xFF8514E1))),
          onPressed: () {},
          child: const Text('Start Quize'),
        ),
      ],
    );
  }
}
