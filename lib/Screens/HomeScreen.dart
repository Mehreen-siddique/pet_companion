import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as dart_ui;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pet_companion/Screens/SleepScreen.dart';
import 'package:pet_companion/Utils/colorPalete.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final double sleep = 0.8;   // 80%
  final double happiness = 0.6; // 60%
  final double hunger = 0.3; // 30%
  final double game = 0.2; // 20%






  Widget buildLiquidStat(String label, double percent, Color color, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          child: LiquidCircularProgressIndicator(
            value: percent,
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
                const SizedBox(height: 4),
                Text(
                  "${(percent * 100).toInt()}%",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )
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
            buildLiquidStat("Happy", happiness, Colors.teal, Icons.emoji_emotions),
            buildLiquidStat("Hungry", hunger, Colors.orange, Icons.fastfood),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Sleepscreen()));
              },
                child: buildLiquidStat("Sleep", sleep, Colors.pink.shade200, Icons.bedtime)),
            buildLiquidStat("Game", game, Colors.red.shade400, Icons.sports_esports),
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
