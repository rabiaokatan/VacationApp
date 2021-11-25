import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/screens/question_screen.dart';
import 'package:flutter_vacation_app/widgets/button.dart';

import '../responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: isDesktop
                  ? AssetImage('assets/images/welcome_screen_bg_desktop.jpeg')
                  : AssetImage('assets/images/welcome_page_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.65), BlendMode.dstATop),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                button(
                  context: context,
                  onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(),
                      ),
                    );
                  },
                  text: "Teste Başla",
                  color: Colors.white,
                  textColor: Colors.green.shade900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
