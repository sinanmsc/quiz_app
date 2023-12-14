import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  final int optionNo;
  final String option;
  final Color? bgColor;
  final Color borderColor;

  const OptionContainer({
    required this.optionNo,
    required this.option,
    required this.borderColor,
    this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 1, color: borderColor),
      ),
      child: Row(
        children: [
          Text(
            '$optionNo.   ',
            style: TextStyle(color: borderColor, fontSize: 20),
          ),
          SizedBox(
            width: 275,
            child: Text(
              option,
              style: TextStyle(color: borderColor, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
