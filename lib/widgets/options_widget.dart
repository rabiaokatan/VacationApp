import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_vacation_app/utils.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        physics: BouncingScrollPhysics(),
        children: Utils.heightBetween(
          question.options
              .map((option) => buildOption(context, option))
              .toList(),
          height: 8,
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);

    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildAnswer(option),
          ],
        ),
      ),
    );
  }

  Widget buildAnswer(Option option) => Container(
        height: 50,
        child: Row(children: [
          SizedBox(width: 12),
          Text(
            option.text,
            style: TextStyle(fontSize: 20),
          )
        ]),
      );

  Color getColorForOption(Option option, Question question) {
  //   final isSelected = option == question.selectedOption;
  //     return isSelected ? Colors.green : Colors.grey.shade200;
  //  }
   final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200;
    } else {
      return Colors.green;
    }
  }
}