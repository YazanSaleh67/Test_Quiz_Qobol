import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TestTop10ScoreModel.g.dart';
@JsonSerializable(explicitToJson: true) 

class  Top10scoredata{
  String? name ;
  int? score ;
  Top10scoredata({this.name , this.score}) ;
  factory Top10scoredata.fromJson(Map<String , dynamic>data)=>  _$Top10scoredataFromJson(data) ;
  Map<String , dynamic> toJson() =>  _$Top10scoredataToJson(this) ;
}