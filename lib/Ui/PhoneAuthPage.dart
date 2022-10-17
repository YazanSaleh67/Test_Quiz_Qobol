import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:quiz_qobol/Ui/NameAuthPage.dart';

enum MobileVerficationState {
  SHOW_Mobile_Form_State,
  Show_OTP_Form_State,
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  MobileVerficationState currentstate =
      MobileVerficationState.SHOW_Mobile_Form_State;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  bool? showLoading = false;
  void SignInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential.user != null) {
        Navigator.of(context).pushReplacementNamed('HomeScreenPage');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.message}')));
    }
    ;
  }

  getMobileNumber(context) {
    return Center(
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
              margin: const EdgeInsets.symmetric(horizontal: 155),
              alignment: Alignment.center,
              child: const Text(
                "Quiz",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              )),
          const SizedBox(
            height: 15.0,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              alignment: Alignment.center,
              child: const Text(
                "Enter your phone number to continue ,  and we will send you OTP on your phone number.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              )),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Mobile',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Theme(
                  data: Theme.of(context)
                    ..copyWith(splashColor: Colors.pinkAccent),
                  child: TextFormField(
                    controller: phonenumcontroller,
                    keyboardType: TextInputType.number,
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
                      hintText: '53 555 5555',
                      hintStyle: TextStyle(color: Colors.black),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final code = await Countrypicker.showPicker(
                                    context: context);
                                setState(() {
                                  countrycode = code;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                      child: countrycode != null
                                          ? countrycode!.flagImage
                                          : Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  19,
                                              child: Image.asset(
                                                'images/Flag_of_Saudi_Arabia.svg.png',
                                              ))),
                                  Icon(Icons.arrow_drop_down),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      countrycode?.dialCode ?? '+966',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      showLoading = true;
                    });
                    await _auth.verifyPhoneNumber(
                       // timeout: Duration(seconds: 45),
                        phoneNumber: phonenumcontroller.text,
                        verificationCompleted: (phoneAuthCredential) async {
                          setState(() {
                            showLoading = false;
                          });
                        },
                    verificationFailed: (verificationFailed) async {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("${verificationFailed.message}")));
                          setState(() {
                            showLoading = false;
                          });
                        },
                        codeSent: ((verificationId, resendingToken) async {
                          setState(() {
                            currentstate =
                                MobileVerficationState.Show_OTP_Form_State;
                            this.verificationId = verificationId;

                            showLoading = false;
                          });
                        }),
                        codeAutoRetrievalTimeout: ((verificationId) async {}));

                    if (countrycode != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${countrycode!.dialCode}-${phonenumcontroller.text.trim()}')));
                      print(
                          '${countrycode!.dialCode}-${phonenumcontroller.text.trim()}');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('PLease Enter A Phone Number')));
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NamePage(),
                      ));
                      print('null');
                    }
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }

  getOTP(context) {
    return Container(
      margin: const EdgeInsets.only(top: 45.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Verification Code',
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              )),
          Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'We have sent the code verification to',
                style: TextStyle(color: Colors.white),
              )),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('${phonenumcontroller.text}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Theme(
              data: Theme.of(context)..copyWith(splashColor: Colors.pinkAccent),
              child: TextFormField(
                controller: OTPnumcontroller,
                keyboardType: TextInputType.number,
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
                  hintText: 'OTP',
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Enter OTP',
                  labelStyle: TextStyle(color: Colors.black),
                  prefixIcon: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // GestureDetector(
                        //   onTap: () async {
                        //     final code =
                        //         await Countrypicker.showPicker(context: context);
                        //     setState(() {
                        //       countrycode = code;
                        //     });
                        //   },
                        //   child: Row(
                        //     children: [
                        //       Container(
                        //           child: countrycode != null
                        //               ? countrycode!.flagImage
                        //               : Container(
                        //                   width: MediaQuery.of(context).size.width / 8,
                        //                   height:
                        //                       MediaQuery.of(context).size.height / 19,
                        //                   child: Image.asset(
                        //                     'images/Flag_of_Saudi_Arabia.svg.png',
                        //                   ))),
                        //       Icon(Icons.arrow_drop_down),
                        //       const SizedBox(
                        //         width: 10.0,
                        //       ),
                        //       Container(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 16, vertical: 6),
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(5)),
                        //         child: Text(
                        //           countrycode?.dialCode ?? '+966',
                        //           style: TextStyle(color: Colors.black),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
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
            child: ElevatedButton(
              onPressed: () async {
                final PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: OTPnumcontroller.text);
                SignInWithPhoneAuthCredential(phoneAuthCredential);
              },
              child: Text(
                'Verify',
                style: TextStyle(color: Colors.black),
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
    );
  }

  String OTPPIN = '';
  final Countrypicker = const FlCountryCodePicker();
  final phonenumcontroller = new TextEditingController();
  final OTPnumcontroller = new TextEditingController();
  CountryCode? countrycode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Color.fromARGB(255, 0, 223, 216),
      body: showLoading == true
          ? const Center(
              child: CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 200, 255),
            ))
          : currentstate == MobileVerficationState.SHOW_Mobile_Form_State
              ? getMobileNumber(context)
              : getOTP(context),
    );
  }
}
