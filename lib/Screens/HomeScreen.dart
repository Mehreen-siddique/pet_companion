import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as dart_ui;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final double health = 0.8;   // 80%
  final double happiness = 0.6; // 60%
  final double hunger = 0.3; // 30%
  


Widget buildProgressBar(String label, double value, Color color){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
      gradient: dart_ui.LinearGradient(
        colors: [color.withOpacity(0.8), color],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
      child: Row(
      children: [
        Text( label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        const SizedBox(width: 10),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Colors.white,
              minHeight: 10,
            ),
          ),
        ),
    ],
  ),

  );
}
  Widget buildGameButton(IconData icon, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0Xff37584D),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 5),
          Text(text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }


  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Icon(Icons.home, color: Colors.white, size: 22,),
      //       SizedBox(width: 70,),
      //       Text("Home", style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),),
      //     ],
      //   ),
      //   backgroundColor: AppColors.primaryColor,
      //   centerTitle: true,
      // ),
      body:  Stack(
        children: [

          Positioned.fill(
            child: Image

              (image:
            AssetImage('images/bc.png'
                ),
              fit: BoxFit.cover,   // fills screen, keeps ratio
              width: double.infinity,
              height: double.infinity,
            ),),

    SafeArea(
    child: Column(
    children: [
    // Top Progress Bars

    Padding(
    padding:  EdgeInsets.all(16.0),
    child:  Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      child: Column(
        children: [

          buildProgressBar("❤️ Happiness",happiness, Colors.pink),
          const SizedBox(height: 10),
          buildProgressBar("🍖 Hunger", hunger, Colors.orange),
          const SizedBox(height: 10),
          buildProgressBar("💪 Health", health, Colors.green),
        ],
      ) ,
    ),
    ),
      SizedBox(height: 290,),
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8), // semi-transparent
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildGameButton(Icons.set_meal, "Feed"),
            buildGameButton(Icons.sports_esports, "Play"),
            buildGameButton(Icons.nightlight_round, "Sleep"),
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
