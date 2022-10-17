import 'package:flutter/material.dart';
import 'package:quiz_qobol/Ui/HomeScreen.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final Namecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 223, 216),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 0, 223, 216),
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'StartPage');
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
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
              padding: EdgeInsets.symmetric(horizontal: 80),
              alignment: Alignment.center,
              child: Text(
                'Please Enter Your Binary Name.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Theme(
                data: Theme.of(context)
                  ..copyWith(splashColor: Colors.pinkAccent),
                child: TextFormField(
                  controller: Namecontroller,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintText: 'Yazan Saleh',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Enter Your Name',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 6),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [],
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pinkAccent),
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Center(
                child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 18,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context)
                      .pushReplacementNamed('bottomnavigationbar');
                },
                child: Text(
                  "Let's Gooooo....",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                ),
              ),
            ))
          ],
        ),
      )),
    );
  }
}
