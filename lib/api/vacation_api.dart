import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vacation_app/models/vacation.dart';

class VacationApi{
   static Future<List<Vacation>> getUsersLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/vacation.json');
    final body = json.decode(data);

    return body.map<Vacation>(Vacation.fromJson).toList();
  }
}