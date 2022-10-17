import 'package:firebase_core/firebase_core.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_qobol/Provider/QuizProvider.dart';
import 'package:quiz_qobol/Ui/LeaderBoard.dart';
import 'package:quiz_qobol/Ui/NameAuthPage.dart';
import 'package:quiz_qobol/Ui/HomeScreen.dart';
import 'package:quiz_qobol/Ui/PhoneAuthPage.dart';
import 'package:quiz_qobol/Ui/ProfilePage.dart';
import 'package:quiz_qobol/Ui/bottomnavigationbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuizProvider(),
        child: MaterialApp(
          routes: {
            'StartPage': (context) => StartPage(),
            'HomeScreenPage': (context) => QuizHomeScreen(),
            'bottomnavigationbar': (context) => bottomnavigationbar(),
          },
          debugShowCheckedModeBanner: false,
          // title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "NotoSerif",
          ),
          home: LeaderBoard(),
        ));
  }
}
