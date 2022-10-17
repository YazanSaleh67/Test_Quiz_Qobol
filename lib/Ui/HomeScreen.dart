import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({
    super.key,
  });

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 223, 216),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('StartPage');
            },
            icon: Icon(Icons.logout),
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 0, 223, 216),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Image.asset(
                        'images/QuizImage2.jpg',
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Are You Ready ?',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'to test your knoweledge and challenge others',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      margin: const EdgeInsets.only(top: 20.0),
                      width: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Answer as much questions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            ' correctly within 2 minutes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.pinkAccent)),
                                onPressed: () {},
                                child: const Text(
                                  'Quiz Me !',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
