import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as dart_ui;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_companion/Utils/colorPalete.dart';
import 'package:rive/rive.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final double health = 0.8;   // 80%
  final double happiness = 0.6; // 60%
  final double hunger = 0.3; // 30%

  double progressValue = 0.5; // 50% filled


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


  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.white, size: 22,),
            SizedBox(width: 70,),
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
      body:  Stack(
        children: [
          Positioned.fill(
            child: RiveAnimation.asset(
              'assets/riv/background1.riv',
              fit: BoxFit.cover, // ya contain / fitHeight try karo
              alignment: Alignment.center,
            ),
          ),
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


//       SafeArea(
//           child: (
// Column(
//         children: [
//
//           Padding(
//             padding:  EdgeInsets.all(16.0),
//             child:
//             Column(
//
//               children: [
//                 buildProgressBar("❤️ Happiness", happiness, Colors.pink),
//                 SizedBox(height: 10),
//                 buildProgressBar("🍖 Hunger", hunger, Colors.orange),
//                 SizedBox(height: 10),
//                 buildProgressBar("💪 Health", health, Colors.green),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child:Container(
//                 height: double.infinity,
//                   width: double.infinity,
//                   child: Stack(
//                     children: [
//                       RiveAnimation.asset('assets/riv/background1.riv'),
//                       Positioned(
//
//                         child: Lottie.asset(
//                           'assets/lottie/cat1.json',
//                           width: 200,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   )
//
//               ),
//
//             ),
//           ),
//
//
//         ],
//       )),
//       )
    ),
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

    ]
    ),
    ),
    ]
      )

    );
  }
}
