import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/screens/question_screen.dart';

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
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      // border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      child: Text(
                        'Teste Başla',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700, color: Colors.green.shade900),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
