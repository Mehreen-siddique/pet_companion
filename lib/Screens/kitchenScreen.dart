import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with TickerProviderStateMixin {
  double hunger = 0.5; // Example stat

  void feedPet(String food) {
    setState(() {
      hunger = (hunger + 0.2).clamp(0.0, 1.0);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Fed with $food")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background - kitchen illustration (replace with your asset)
          Positioned.fill(
            child: Image.asset(
              "assets/images/kitchen_bg.png",
              fit: BoxFit.cover,
            ),
          ),

          /// Pet in center
          Align(
            alignment: Alignment.center,
            child: Lottie.asset(
              "assets/lottie/cat1.json",
              height: 220,
            ),
          ),

          /// Food bar (bottom)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  foodItem("Milk", "assets/lottie/milk.json"),
                  foodItem("Fish", "assets/lottie/fish.json"),
                  foodItem("Cake", "assets/lottie/cake.json"),
                  foodItem("Apple", "assets/lottie/apple.json"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget foodItem(String name, String asset) {
    return GestureDetector(
      onTap: () => feedPet(name),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(asset, height: 70),
          Text(
            name,
            style: GoogleFonts.chewy(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
