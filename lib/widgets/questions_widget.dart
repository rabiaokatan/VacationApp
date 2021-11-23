import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_vacation_app/responsive.dart';
import 'package:flutter_vacation_app/screens/question_screen.dart';
import 'package:flutter_vacation_app/screens/welcome_screen.dart';
import 'package:flutter_vacation_app/widgets/options_widget.dart';

class QuestionsWidget extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;

  QuestionsWidget({
    Key? key,
    // required this.context,
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
    bool isTablet= Responsive.isTablet(context);
    bool isDesktop= Responsive.isDesktop(context);
    return SafeArea(
      child: Container(
        padding: isMobile
            ? EdgeInsets.all(_size.width*0.05)
            : isTablet
                ? EdgeInsets.symmetric(vertical: _size.height*0.05, horizontal: _size.width*0.2)
                : EdgeInsets.symmetric(vertical: _size.height*0.10, horizontal: _size.width*0.1),
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
                IconButton(
                  onPressed: () {
                    controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                IconButton(
                  onPressed: () {
                    controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
           SizedBox(height:_size.height*0.03),
            Padding(
              padding: isDesktop ? EdgeInsets.symmetric(vertical: _size.height*0.02, horizontal: _size.width*0.2) : EdgeInsets.all(0),
              child: FAProgressBar(
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
            ),
           SizedBox(height:_size.height*0.04),
            Padding(
              padding: isDesktop ? EdgeInsets.symmetric(vertical: _size.height*0.02, horizontal: _size.width*0.2) : EdgeInsets.all(0),
              child: Text(
                question.text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
           SizedBox(height: _size.height*0.04),
             
              Expanded(
                child: Padding(
                 padding: isDesktop ? EdgeInsets.symmetric(vertical: _size.height*0.02, horizontal: _size.width*0.2) : EdgeInsets.all(0),
                  child: OptionsWidget(
                    question: question,
                    onClickedOption: onClickedOption,
                  ),
                ),
              ),
            
            question.id == 4
                ? GestureDetector(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
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
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
