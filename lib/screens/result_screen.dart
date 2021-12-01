import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vacation_app/api/vacation_api.dart';
import 'package:flutter_vacation_app/models/vacation.dart';
import 'package:flutter_vacation_app/widgets/button.dart';

import '../responsive.dart';

class ResultScreen extends StatelessWidget {
  final List<Vacation> listVacation;
  ResultScreen({
    Key? key,
    required this.listVacation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);
    bool isDesktop = Responsive.isDesktop(context);
    CarouselController buttonCarouselController = CarouselController();
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
          child: CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: _size.height,
              enableInfiniteScroll: false,
            ),
            items: listVacation.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        child: Image.network(
                          item.photUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:_size.width*0.05),
                      child: Text(
                        item.text,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(flex: 2),
                    isDesktop
                        ? button(
                            context: context,
                            onTap: () {
                              item.id != listVacation.last.id
                                  ? buttonCarouselController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear)
                                  : buttonCarouselController.animateToPage(
                                      0,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear,
                                    );
                            },
                            text: 'Diğer Sonuç',
                            color: Colors.green.shade900,
                            textColor: Colors.white)
                        : Container(),
                    Spacer()
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
