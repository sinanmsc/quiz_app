import 'package:flutter/material.dart';
import 'package:quiz_app/view/home/home_widgets/hoe_header_widget.dart';
import 'package:quiz_app/view/home/home_widgets/home_footer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF481450),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              HomeHeaderWidget(),
              HomeFooterWidget()
            ],
          ),
        ));
  }
}
