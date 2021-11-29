import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/api/vacation_api.dart';
import 'package:flutter_vacation_app/models/option.dart';
import 'package:flutter_vacation_app/models/question.dart';
import 'package:flutter_vacation_app/models/vacation.dart';

import '../responsive.dart';

class OptionsWidget extends StatelessWidget {
  final Question? question;
  final ValueChanged<Option>? onClickedOption;
  //List<String> tagList = [];

  OptionsWidget({
    Key? key,
    /*required*/ this.question,
    /* required*/ this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        physics: BouncingScrollPhysics(),
        children: question!.options
            .map((option) => buildOption(context, option))
            .toList(),
      );

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question!);
    Size _size = MediaQuery.of(context).size;
    bool isMobile = Responsive.isMobile(context);
    bool isTablet = Responsive.isTablet(context);

    return GestureDetector(
      onTap: () => onClickedOption!(option),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: _size.height *
                (isMobile
                    ? 0.02
                    : isTablet
                        ? 0.015
                        : 0.018)),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              buildAnswer(option),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnswer(Option option) => Container(
        height: 50,
        child: Row(children: [
          SizedBox(width: 12),
          Text(
            option.text,
            style: TextStyle(fontSize: 20),
          )
        ]),
      );

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;

    if (!isSelected) {
      return Colors.grey.shade200.withOpacity(0.6);
    } else {
      return Colors.green;
    }
  }

  List<Vacation> getResult(List tagList, BuildContext context) {
    
    List<Vacation> resultVacationList = [];

    List<Vacation> vacations = [];
    VacationApi.getUsersLocally(context).then((value) {
      vacations = value;
      for (var item in vacations) {
        if (listEquals(tagList, item.tags)) {
          resultVacationList.add(item);
        }
      }
    });
    return resultVacationList;
  }
}
