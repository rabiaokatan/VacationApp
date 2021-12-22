import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/screens/question_screen.dart';
import 'package:flutter_vacation_app/widgets/button.dart';

import '../responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:_size.width*0.05),
                  child: Text(
                    'Tatile gitmek istiyorsunuz ancak nasıl bir tatil yapmak istediğinize ve nereye gideceğinize henüz karar veremediniz mi? Öyleyse testteki soruları cevaplayın, biz de size en uygun tatil yerlerini önerelim.',
                    style: TextStyle(
                        color: Colors.green.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: _size.height*0.3),
                  child: button(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
