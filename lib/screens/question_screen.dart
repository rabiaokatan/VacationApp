import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_vacation_app/widgets/questions_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  PageController? controller;
  Question? question;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = questions.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: QuestionsWidget(
          controller: controller!,
          onChangedPage: (index) => nextQuestion(index: index),
          onClickedOption: selectOption,
        ),
      );

  void selectOption(Option option) {
    setState(() {
      question!.isLocked = true;
      question!.selectedOption = option;
    });
  }

  void nextQuestion({int? index}) {
    final nextPage = controller!.page!.toInt() + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = questions[indexPage];
    });
  }
}
