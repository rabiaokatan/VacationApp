import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_vacation_app/widgets/options_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;

 QuestionsWidget({
    Key? key,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onChangedPage,
      controller: controller,
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        return buildQuestion(question: question);
      },
    );
  }

  Widget buildQuestion({
    required Question question,
  }) =>
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              FAProgressBar(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
                progressColor: Colors.green.shade900,
                maxValue: 4,
                currentValue: question.id,
                displayText: '/${questions.length} Soru   ',
                displayTextStyle: TextStyle(fontSize: 16, color: Colors.white,),
              ),
              const SizedBox(height: 32),
              // Center(
              //   child: Text(
              //     "Soru ${question.id} / 4",
              //     style: TextStyle(fontSize: 27, color: Colors.grey),
              //   ),
              // ),
              // const SizedBox(height: 10),
              // Divider(thickness: 1),
              const SizedBox(height: 20),
              Text(
                question.text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 4),
              Text('(Sorular arasında geçiş yapmak için ekranı kaydırın.)', style: TextStyle(color: Colors.grey),),
              SizedBox(height: 28),
              Expanded(
                child: OptionsWidget(
                  question: question,
                  onClickedOption: onClickedOption,
                ),
              ),
              // Center(child: Text('Sorular arasında geçiş için ekranı kaydırın.', style: TextStyle(color: Colors.grey),))
            ],
          ),
        ),
      );
}
