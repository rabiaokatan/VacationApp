import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/vacation.dart';

import '../responsive.dart';

class ResultScreen extends StatelessWidget {
  Vacation vacation;
  ResultScreen({
    Key? key,
    required this.vacation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    bool isDesktop = Responsive.isDesktop(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.green.shade100, Colors.green.shade400],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(flex: 1),
              Container(
                height: _size.height *
                    (isMobile
                        ? 0.45
                        : isTablet
                            ? 0.5
                            : 0.60),
                width: _size.width *
                    (isMobile
                        ? 0.85
                        : isTablet
                            ? 0.75
                            : 0.32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/welcome_page_bg.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              Spacer(),
              // SizedBox(height: _size.height*0.05),
              Text(vacation.id.toString()),
              Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
