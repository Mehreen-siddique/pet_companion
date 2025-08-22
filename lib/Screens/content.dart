import 'package:flutter/material.dart';
import 'package:pet_companion/Screens/DrawerScreen.dart';
import 'package:pet_companion/Screens/PetSelection.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

              Drawerscreen(),
          petSelectionScreen()

        ],
      ),
    );
  }
}
