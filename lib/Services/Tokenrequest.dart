import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:quiz_qobol/Model/TokenModel.dart';

class TokenServices {
  static Future<Token?> gettoken() async {
    String url = 'https://quizu.okoul.com/Token';
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjYzMzU4NDY1fQ.LlVAcArd2Bn3gtdanoHlfMOsHn0gRMqvVHozUk4bjWM'
    };
    var request = https.Request('GET', Uri.parse(url));
    request.bodyFields = {};
    request.headers.addAll(headers);

    https.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await https.Response.fromStream(response);
      print('here');
      print(jsonDecode(result.body));
      Token decodedResponse = Token.fromJson(jsonDecode(result.body));
      return decodedResponse;
    } else {
      print('xxxxxxxxxxxxxxxxxx ${response.reasonPhrase}');
    }
  }
}
