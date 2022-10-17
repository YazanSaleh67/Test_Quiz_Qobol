import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_qobol/Model/TestTop10ScoreModel.dart';
import 'package:quiz_qobol/Model/TokenModel.dart';
import 'package:quiz_qobol/Model/Top10ScoreModel.dart';
import 'package:quiz_qobol/Services/Tokenrequest.dart';
import 'package:quiz_qobol/Services/Top10Scorerequest.dart';

class QuizProvider extends ChangeNotifier {
  List<TokenData> _token = <TokenData>[];
  get token => _token;

  Future<dynamic> getSearch() async {
    notifyListeners();
    var value = await TokenServices.gettoken();
    _token = value!.tokenData!.tokendatalist!;
    print(_token);
    notifyListeners();
  }

  List<Top10scoredata> _top10score = <Top10scoredata>[];

  get top10score => _top10score;

  Future<List<Top10scoredata>?> gettop10scoredata() async {
    notifyListeners();
    var value = await TOP10SCORESERVICES.gettop10score();
    _top10score = value!.toList();

    // (value!).map((e) => Top10scoredata.fromJson(e)).toList();

    notifyListeners();

    // _top10score =
    //     (value as List).map<TOP10LIST>((e) => TOP10LIST.fromJson(e)).toList();
  }
}
