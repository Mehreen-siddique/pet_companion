import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pet_companion/Screens/content.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeContent()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:Color(0Xff37584D),
        body: Column(
          children: [
            Expanded(child: Image(image: AssetImage('images/Cat.png'))),

          ],
        ),

      ),
    );
  }
}
