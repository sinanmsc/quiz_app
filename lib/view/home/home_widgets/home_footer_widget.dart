import 'package:flutter/material.dart';

class HomeFooterWidget extends StatelessWidget {
  const HomeFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'powered by',
          style: TextStyle(color: Color(0xFF917296)),
        ),
        Text(
          ' www.artifitia.com',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF917296),
              fontSize: 18),
        )
      ],
    );
  }
}
