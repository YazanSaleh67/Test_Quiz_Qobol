import 'package:flutter/material.dart';
import 'package:quiz_qobol/Ui/HomeScreen.dart';
import 'package:quiz_qobol/Ui/LeaderBoard.dart';
import 'package:quiz_qobol/Ui/ProfilePage.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  List<Widget> widgetpages = [
    const QuizHomeScreen(),
    const LeaderBoard(),
    const ProfilePage()
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 223, 216),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(55.0), topLeft: Radius.circular(55.0)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: BottomNavigationBar(
              selectedItemColor: Color.fromARGB(255, 0, 223, 216),
              unselectedItemColor: Color.fromRGBO(75, 85, 99, 75),
              currentIndex: selectedindex,
              onTap: (index) {
                setState(() {
                  selectedindex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    Icons.home_filled,
                    size: 30.0,
                  ),
                ),
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.note,
                      size: 30.0,
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 29.0,
                    )),
              ]),
        ),
      ),
      body: widgetpages.elementAt(selectedindex),
    );
  }
}
