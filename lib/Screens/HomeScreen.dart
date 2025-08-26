import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pet_companion/Screens/GamesScreen.dart';
import 'package:pet_companion/Screens/SleepScreen.dart';
import 'package:pet_companion/Screens/wardrobeScreen.dart';
import 'package:pet_companion/Utils/colorPalete.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {






  Widget buildLiquidStat( Color color, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          child: LiquidCircularProgressIndicator(
            // 0.0 - 1.0
            valueColor: AlwaysStoppedAnimation(color),
            backgroundColor: Colors.white,
            borderColor: Colors.black,
            borderWidth: 2.0,
            direction: Axis.vertical,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.black87, // 👈 now visible on light liquid
                  size: 26,
                  shadows: [
                    Shadow(
                      color: Colors.white.withOpacity(0.6),
                      blurRadius: 6,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }

  






  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [

          Positioned.fill(
            child: Image

              (image:
            AssetImage('images/bc.png'
                ),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),),

    SafeArea(
    child:
    Column(
    children: [
    // Top Progress Bars
      SizedBox(height: 490,),
      Expanded(
        child: Center(
          child: Lottie.asset(
            'assets/lottie/cat1.json',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),

      // Bottom Buttons
      Container(
        padding: EdgeInsets.all(16),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AccessoriesScreen()));
              },
                child: buildLiquidStat(  Colors.orange, Icons.checkroom)),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sleepscreen()));
              },
                child: buildLiquidStat(  Colors.pink.shade200, Icons.bedtime)),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GameChoiceScreen()));
              },
              child: buildLiquidStat( AppColors.primaryColor, Icons.sports_esports,

              ),
            ),
          ],
        ),
      ),

    ]
    ),
    ),
    ]
      )

    );
  }
}
