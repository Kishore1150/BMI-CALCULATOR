import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // primaryColor: Color(0xFF0c1135),
      colorSchemeSeed: const Color(0xFF0c1135),
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Your BMI Result',
            style: TextStyle(color: Colors.white),
          ),
          content: Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  healthcondition,
                  style: TextStyle(
                      color: Color(0xff6bbf60), fontWeight: FontWeight.w800),
                ),
                Text(
                  '$_bmi',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Normal BMI range:',
                  style: TextStyle(color: Color(0xff80818c)),
                ),
                Text(
                  '18.5 - 25 kg/m2',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '$msg',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          backgroundColor: Color(0xff1d1f33),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  double _height = 30.0;
  double _weight = 50.0;
  int _bmi = 0;
  String healthcondition = "Normal";
  String msg = "Your have a normal body weight.Good job!";

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff0c1135),
      drawer: Drawer(),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(60),
      //     child: AppBar(
      //       backgroundColor: Color(0xff0c1135),
      //       title: Text('BMI CALCULATOR', textAlign: TextAlign.center),
      //     )),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Color(0xff0c1135),
            title: Text('BMI CALCULATOR', textAlign: TextAlign.center),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff0c1135)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 140,
                      child: FloatingActionButton.large(
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Icon(
                          Icons.male,
                          size: 55,
                        ),
                        backgroundColor: Color(0xff272a4d),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 120,
                      child: FloatingActionButton.large(
                        onPressed: () => {},
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: const Icon(
                          Icons.female,
                          size: 55,
                        ),
                        backgroundColor: Color(0xff272a4d),
                      ),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 190,
              width: 300,
              decoration: BoxDecoration(
                  color: const Color(0xff14193b),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('HEIGHT',
                      style: TextStyle(
                          color: Color(0xff85899c),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('$_height',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900)),
                  Slider(
                      value: _height,
                      max: 250,
                      min: 0,
                      label: '$_height',
                      divisions: 250,
                      onChanged: (value) => {
                            setState(() {
                              _height = value;
                            })
                          })
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 190,
              width: 300,
              decoration: BoxDecoration(
                  color: const Color(0xff14193b),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('WEIGHT',
                      style: TextStyle(
                          color: Color(0xff85899c),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('$_weight',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w900)),
                  Slider(
                      value: _weight,
                      max: 250,
                      min: 0,
                      label: '$_weight',
                      divisions: 250,
                      onChanged: (value) => {
                            setState(() {
                              _weight = value;
                            })
                          })
                ],
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 300,
              child: FloatingActionButton(
                backgroundColor: Color(0xFFeb1555),
                onPressed: () {
                  setState(() {
                    _bmi = (_weight / ((_height / 100) * (_height / 100)))
                        .round()
                        .toInt();
                    if (_bmi < 18.5) {
                      healthcondition = "Under Weight";
                      msg =
                          "You are underweight. Please consider consulting a healthcare professional.";
                      // changeTextColor("#6bbf60");
                    } else if (_bmi >= 18.5 && _bmi <= 25) {
                      healthcondition = "Normal Weight";
                      // color = "0xff22e67b";
                      msg = "You have a normal body weight.Good job!";
                    } else if (_bmi > 25 && _bmi <= 29.9) {
                      healthcondition = "Over Weight";
                      msg =
                          "You are over weight.Please consider doing a fitness work.";
                    } else {
                      healthcondition = "Obese";
                      msg =
                          "You are obese.Please consider consulting a healthcare professional.";
                    }
                  });
                  _showResultDialog();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Text('CALCULATE YOUR BMI'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
