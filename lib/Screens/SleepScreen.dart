import 'package:flutter/material.dart';

class Sleepscreen extends StatefulWidget {
  const Sleepscreen({super.key});

  @override
  State<Sleepscreen> createState() => _SleepscreenState();
}

class _SleepscreenState extends State<Sleepscreen> with SingleTickerProviderStateMixin {
   AnimationController? _controller;
   Animation<double>? _scaleAnimation; // For breathing effect
   Animation<double>? _zzzAnimation; // For floating ZZZ

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOut),
    );

    _zzzAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'images/1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Sleeping pet with breathing animation
          Positioned(
            top: 400,
            left: 130, // Adjusted for centering
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation!.value,
                  child: Image.asset(
                    'images/sleep1.png',
                    height: 150,
                    width: 150,
                  ),
                );
              },
            ),
          ),
          // Floating ZZZ animation
          Positioned(
            top: 400,
            left: 160, // Above Kitty's head
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _zzzAnimation!.value),
                  child: Opacity(
                    opacity: 0.7,
                    child: const Text(
                      'ZZZ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Moon icon
          Positioned(
            top: 40,
            right: 20,
            child: Icon(
              Icons.bedtime_rounded,
              size: 40,
              color: Colors.yellow.shade700,
            ),
          ),
        ],
      ),
    );
  }
}