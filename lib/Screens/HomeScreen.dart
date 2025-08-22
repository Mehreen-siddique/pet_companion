import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_companion/Utils/colorPalete.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final double health = 0.8;   // 80%
  final double happiness = 0.6; // 60%
  final double hunger = 0.3; // 30%







  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.white, size: 22,),
            Text("Home", style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.background,
        child: Column(
          children: [
            ClipRect(
              child: Image.asset(
                'images/Cat.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
child: Column(
  children: [
    Row(
      children: [
        Text("Happiness", style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),),
        LinearProgressIndicator(
          value: happiness,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          minHeight: 10,
          borderRadius: BorderRadius.circular(10),


        )

      ]

    )
  ],
),
            )
          ],
        ),
      ),
    );
  }
}
