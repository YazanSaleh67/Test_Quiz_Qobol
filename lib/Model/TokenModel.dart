import 'package:flutter/material.dart';

class Token {
  TokenDataList? tokenData;
  Token({this.tokenData});

  Token.fromJson(Map<String, dynamic> json) {
    tokenData =
        json['results'] != null ? TokenDataList.fromJson(json['results']) : null;
    ;
  }
}

class TokenDataList {
  List<TokenData>? tokendatalist;
  TokenDataList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      tokendatalist = <TokenData>[];
      json['data'].forEach((element) {
        tokendatalist!.add(TokenData.fromJson(element));
      });
    }
  }
}

class TokenData {
  String? success;
  String? messages;
  TokenData({this.success, this.messages});
  TokenData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    messages = json['Your token is valid!'];
  }
}
