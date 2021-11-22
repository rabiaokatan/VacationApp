import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_vacation_app/screens/welcome_screen.dart';
import 'package:flutter_vacation_app/widgets/options_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    Future<void> sharedPref () async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.clear();
    }

    return WillPopScope(
      onWillPop: () async {
        await sharedPref();
       Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
            return false;
      },
      child: PageView.builder(
        onPageChanged: onChangedPage,
        controller: controller,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return buildQuestion(question: question);
        },
      ),
    );
  }

  Widget buildQuestion({
    BuildContext ? context,
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
                displayTextStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
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
              Text(
                '(Sorular arasında geçiş yapmak için ekranı kaydırın.)',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 28),
              Expanded(
                child: OptionsWidget(
                  question: question,
                  onClickedOption: onClickedOption,
                ),
              ),
              question.id==4 ?
              GestureDetector(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:18.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          child: Text(
                            'Sonuçları Göster',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context!,
                    //   MaterialPageRoute(
                    //     builder: (context) => QuestionScreen(),
                    //   ),
                    // );
                  },
                ) : Container(),
              // Center(child: Text('Sorular arasında geçiş için ekranı kaydırın.', style: TextStyle(color: Colors.grey),))
            ],
          ),
        ),
      );
}
