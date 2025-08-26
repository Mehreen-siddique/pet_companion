import 'package:flutter/material.dart';
import 'package:pet_companion/Utils/colorPalete.dart';
import 'package:google_fonts/google_fonts.dart';

class GameChoiceScreen extends StatefulWidget {
  const GameChoiceScreen({super.key});

  @override
  State<GameChoiceScreen> createState() => _GameChoiceScreenState();
}

class _GameChoiceScreenState extends State<GameChoiceScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  final games = [
    {"title": "Jumping Fun", "icon": Icons.sports_esports},
    {"title": "Puzzle Play", "icon": Icons.extension},
    {"title": "Memory Match", "icon": Icons.memory},
    {"title": "Fruit Catch", "icon": Icons.local_pizza},
    {"title": "Race Run", "icon": Icons.directions_run},
    {"title": "Quiz Time", "icon": Icons.question_answer},
  ];

  @override
  void initState() {
    super.initState();

    // Har card ka apna controller (delayed start for natural vibe)
    _controllers = List.generate(
      games.length,
          (index) => AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      )..repeat(reverse: true, period: const Duration(seconds: 3)),
    );

    // Delay per card start for natural bounce
    for (int i = 0; i < _controllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 400), () {
        if (mounted) _controllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }


  Widget _buildAnimatedGameCard(
      String title, IconData icon, AnimationController controller) {
    return ScaleTransition(
      scale: Tween(begin: 0.95, end: 1.05)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(controller),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$title coming soon!")),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color:AppColors.primaryColor,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.secondaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(2, 4),
                blurRadius: 6,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: AppColors.secondaryColor),
              const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.chewy(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black54,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.secondaryBackground,
          // gradient: LinearGradient(
          //   colors: [Color(0xFF26A69A), Color(0xFF004D40)],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "🎮 Choose a Game",
                style: GoogleFonts.chewy(
                  textStyle: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                  ),
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return _buildAnimatedGameCard(
                      game["title"] as String,
                      game["icon"] as IconData,
                      _controllers[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
