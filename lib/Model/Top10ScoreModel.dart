import 'package:flutter/material.dart';

// class TOP10LISTDATA {
//   List<TOP10LIST>? top10listdata;
//     List<TOP10LIST>? finaltop10listdata;
//   TOP10LISTDATA.fromJson(Map<String, dynamic> json) {
//     if (top10listdata != null) {
//       top10listdata = <TOP10LIST>[];
//       top10listdata?.forEach((element) {
//         top10listdata!.add(TOP10LIST.fromJson(element));
//         final finaltop10listdata =
//             (top10listdata as List).map((e) => TOP10LIST.fromJson(e));
//       });
//     }
//   }
// }

class TOP10LIST {
  List<TOP10LIST> top10list = <TOP10LIST>[];
  String? name;
  String? score;
  TOP10LIST({this.name, this.score});
  TOP10LIST.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
  }
}
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   data['score'] = score;
  //   return data;
  // }


// class TOP10LISTDATA {
//   List<TOP10LIST> top10scoredata = <TOP10LIST>[];
//   List<TOP10LIST> finaltop10scoredata = <TOP10LIST>[];

//   TOP10LISTDATA.fromJson(List<dynamic> json) {
//     if (top10scoredata != null) {
//       top10scoredata = <TOP10LIST>[];
//       var finaltop10scoredata = top10scoredata.forEach((element) {
//         top10scoredata.add(TOP10LIST.fromJson(element));
//       });
//       (finaltop10scoredata as List).map((e) => TOP10LIST.fromJson(e)).toList();
//     }
//   }
// }
// class Top10ScoreList {
//   List<Top10ScoreData>? top10scorelist;
//   Top10ScoreList.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//      top10scorelist = <Top10ScoreData>[];
//       json['data'].forEach((element) {
//         top10scorelist!.add(Top10ScoreData.fromJson(element));
//       });
//     }
//   }
// }

// class Top10ScoreData {
//   String? name;
//   String? score;
//   Top10ScoreData({this.name, this.score});
//   Top10ScoreData.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     score = json['score'];
//   }
// }
