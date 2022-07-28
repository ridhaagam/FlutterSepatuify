import 'dart:convert';

import 'package:mobile_one/models/sepatu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SepatuProvider extends ChangeNotifier {
  getRecommendedSepatus() async {
    var result = await http.get(
      Uri.parse('https://sepatuifynodejs.herokuapp.com/sepatu'),
    );

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Sepatu> sepatus = data.map((item) => Sepatu.fromJson(item)).toList();
      return sepatus;
    } else {
      return <Sepatu>[];
    }
  }
}
