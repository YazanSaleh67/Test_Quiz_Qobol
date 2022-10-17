import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_qobol/Model/TestTop10ScoreModel.dart';
import 'package:quiz_qobol/Model/TokenModel.dart';
import 'package:quiz_qobol/Model/Top10ScoreModel.dart';

class TOP10SCORESERVICES {
  static Future<List<Top10scoredata>?> gettop10score() async {
    List<Top10scoredata> _decodedResponse = <Top10scoredata>[];
    String url = 'https://quizu.okoul.com/TopScores';

    try {
      var request = http.Request('GET', Uri.parse(url));
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAyNywiaWF0IjoxNjYzODczMDY3fQ.AdwZKTIvTA9fy1x6VJ2YXrAb3I-hLFH9tZnCV6PBW2I'
      };
      request.bodyFields = {};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode == 200);
      if (response.statusCode == 200) {
        var result = await http.Response.fromStream(response);
        print('here');
        print(jsonDecode(result.body));

        Top10scoredata decodedResponse =
            Top10scoredata.fromJson(jsonDecode(result.body));
        print(Top10scoredata.fromJson(jsonDecode(result.body)));
        if (decodedResponse != null) {
          List<Top10scoredata> _decodedResponse = <Top10scoredata>[];
          _decodedResponse.forEach(((element) {
            _decodedResponse
                .add(Top10scoredata.fromJson(jsonDecode(result.body)));
          }));
          (_decodedResponse)
              .map((e) => Top10scoredata.fromJson(jsonDecode(result.body)));
        }
        // if (decodedResponse != null) {
        //   _decodedResponse = <Top10scoredata>[];
        //   _decodedResponse.forEach((element) {
        //     _decodedResponse
        //         .add(Top10scoredata.fromJson(jsonDecode(result.body)));
        //     (_decodedResponse)
        //         .map((e) => Top10scoredata.fromJson(jsonDecode(result.body)))
        //         .toList();
        //   });
        // }
        print(_decodedResponse);
        return _decodedResponse;
      } else {
        print('xxxxxxxxxxxxxxx: ${response.reasonPhrase}');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
