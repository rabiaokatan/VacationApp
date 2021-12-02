import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/api/vacation_api.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_vacation_app/models/vacation.dart';
import 'package:flutter_vacation_app/responsive.dart';
import 'package:flutter_vacation_app/screens/result_screen.dart';
import 'package:flutter_vacation_app/screens/welcome_screen.dart';
import 'package:flutter_vacation_app/widgets/button.dart';
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
    return WillPopScope(
      onWillPop: () async {
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
          return buildQuestion(question: question, context: context);
        },
      ),
    );
  }

  Widget buildQuestion({
    required BuildContext? context,
    required Question question,
  }) {
    Size _size = MediaQuery.of(context!).size;
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    bool isDesktop = Responsive.isDesktop(context);
    List<String> tagList = [];
    return SafeArea(
      child: Container(
        padding: isMobile
            ? EdgeInsets.all(_size.width * 0.05)
            : isTablet
                ? EdgeInsets.symmetric(
                    vertical: _size.height * 0.25,
                    horizontal: _size.width * 0.2)
                : EdgeInsets.symmetric(
                    vertical: _size.height * 0.10,
                    horizontal: _size.width * 0.1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.green.shade100, Colors.green.shade400],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                question.id != questions[0].id
                    ? IconButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                      )
                    : Container(),
                question.id != questions[questions.length - 1].id
                    ? IconButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: _size.height * 0.03),
            Padding(
              padding: isDesktop
                  ? EdgeInsets.symmetric(
                      vertical: _size.height * 0.02,
                      horizontal: _size.width * 0.2)
                  : EdgeInsets.all(0),
              child: FAProgressBar(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
                progressColor: Colors.green.shade900,
                maxValue: questions.length,
                currentValue: question.id,
                displayText: '/${questions.length} Soru   ',
                displayTextStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: _size.height * 0.04),
            Padding(
              padding: isDesktop
                  ? EdgeInsets.symmetric(
                      vertical: _size.height * 0.02,
                      horizontal: _size.width * 0.2)
                  : EdgeInsets.all(0),
              child: Text(
                question.text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(height: _size.height * 0.04),
            Expanded(
              child: Padding(
                padding: isDesktop
                    ? EdgeInsets.symmetric(
                        vertical: _size.height * 0.02,
                        horizontal: _size.width * 0.2)
                    : EdgeInsets.all(0),
                child: OptionsWidget(
                  question: question,
                  onClickedOption: onClickedOption,
                ),
              ),
            ),
            question.id == questions[questions.length - 1].id
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: button(
                        context: context,
                        onTap: () {
                          for (int i = 0; i < questions.length; i++) {
                            if (questions[i].isLocked!) {
                              if (questions[i].selectedOption!.tag != '') {
                                tagList.add(questions[i].selectedOption!.tag);
                              }
                            }
                          }
                          List<Vacation> resultListVacation =
                              OptionsWidget().getResult(tagList, context);
              
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                listVacation: resultListVacation,
                              ),
                            ),
                          );
                        },
                        text: "Sonuçları Göster",
                        color: Colors.green.shade900,
                        textColor: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
