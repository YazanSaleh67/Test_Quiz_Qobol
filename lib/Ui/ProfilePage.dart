import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          'Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 0, 223, 216),
      body: ListView(
        children: [
          ClipRect(
            child: Center(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.1,
                margin: const EdgeInsets.only(bottom: 40.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                    )),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 0.0,
                      child: Container(
                        
                          // margin: const EdgeInsets.only(bottom: 40.0),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          width: MediaQuery.of(context).size.width/4,
                          height: MediaQuery.of(context).size.height/10,
                          child: Image.network(
                              'https://marketplace.canva.com/EAE6OJ2qP8U/1/0/1600w/canva-gamer-with-glasses-character-twitch-profile-picture-CVfgWIJGgRo.jpg')),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Text(
                              'Yazan',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 223, 216),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Text(
                              '+966580630165',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 223, 216),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: Colors.white),
                                color: Color.fromARGB(255, 0, 223, 216),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 0, 223, 216)),
                                              color: Color.fromARGB(
                                                  255, 0, 223, 216)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                          child: Image.asset(
                                            fit: BoxFit.contain,
                                            "images/trophy.png",
                                          )),
                                      Container(
                                        child: const Text(
                                          'SCORE',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Container(
                                        child: const Text(
                                          '200',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 35.0,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 0, 223, 216)),
                                              color: Color.fromARGB(
                                                  255, 0, 223, 216)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                          child: Image.asset(
                                            fit: BoxFit.contain,
                                            "images/world.png",
                                          )),
                                      Container(
                                        child: const Text(
                                          'WORLD RANK',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Container(
                                        child: const Text(
                                          '#1973',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 0, 223, 216)),
                                              color: Color.fromARGB(
                                                  255, 0, 223, 216)),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                          child: Image.asset(
                                            fit: BoxFit.contain,
                                            "images/locationmark.png",
                                          )),
                                      Container(
                                        child: const Text(
                                          'LOCAL RANK',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Container(
                                        child: const Text(
                                          '#75',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.white),
                          color: Color.fromARGB(255, 0, 223, 216),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    'My Scores',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 180.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          13,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      child: Image.asset(
                                        'images/score.png',
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
