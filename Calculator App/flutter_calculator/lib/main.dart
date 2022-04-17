import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalculatorApp',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculator'),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          '9',
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        onPressed: () => {},
                        color: Color(0XFF8ac4d0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
