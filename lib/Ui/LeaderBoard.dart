import 'package:flutter/material.dart';
import 'package:quiz_qobol/Provider/QuizProvider.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final QuizProvider quizProvider = QuizProvider();
  late Future _gettop10score;
  @override
  void initState() {
    _gettop10score = GetTOP10SCORE();
    super.initState();
  }

  Future GetTOP10SCORE() async {
    await quizProvider.gettop10scoredata();
  }

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
          'LeaderBoard',
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
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.white,
                    )),
                alignment: Alignment.center,
                child: FutureBuilder(
                  future: _gettop10score,
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return ListView.builder(
                      itemCount: quizProvider.top10score.length , 
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Text('1'),
                          title: Text(
                              quizProvider.top10score[index].name.toString()),
                          subtitle: Text(
                              quizProvider.top10score[index].score.toString()),
                        );
                      },
                    );
                  },
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
