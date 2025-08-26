import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_companion/Screens/HomeScreen.dart';
import 'package:pet_companion/Screens/SettingsScreen.dart';
import 'package:pet_companion/Utils/colorPalete.dart';

class Drawerscreen extends StatefulWidget {
  const Drawerscreen({super.key});

  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {


  Widget buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              text,
              style: GoogleFonts.bungee(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomAction(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.bungee(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor, // teal green main
           AppColors.secondaryColor, // lighter teal/green
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.pets, color: Colors.white, size: 30),
                  const SizedBox(width: 8),
                  Text(
                    "Pet Companion",
                    style: GoogleFonts.bungee(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80,),
            buildMenuItem(
              icon: Icons.home,
              text: "Home",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Homescreen()));
              },
            ),
            buildMenuItem(icon: Icons.favorite, text: "Pet Stats"),
            buildMenuItem(icon: Icons.volunteer_activism, text: "Care Actions"),
            buildMenuItem(icon: Icons.catching_pokemon, text: "Pet Selection"),
            buildMenuItem(icon: Icons.settings, text: "Settings",
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()));
              }

            ),

            const Spacer(),

            // Bottom Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBottomAction(Icons.info_outline, "About"),
                Container(width: 1, height: 20, color: Colors.white70),
                buildBottomAction(Icons.logout, "Logout"),
              ],
            )



          ],
        ),
      ),
    );
  }
}
