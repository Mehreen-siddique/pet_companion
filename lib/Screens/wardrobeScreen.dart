import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AccessoriesScreen extends StatefulWidget {
  const AccessoriesScreen({super.key});

  @override
  State<AccessoriesScreen> createState() => _AccessoriesScreenState();
}

class _AccessoriesScreenState extends State<AccessoriesScreen> {
  String? selectedAccessory;

  final List<Map<String, String>> accessories = [
    {"name": "Cap", "image": "images/cap1.png"},
    {"name": "Glasses", "image": "images/glasses.png"},
    {"name": "Bow", "image": "images/glasses2.png"},
    {"name": "Crown", "image": "images/cap2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      body: Stack(
        children: [
          /// Top Bar
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Accessories",
                  style: GoogleFonts.chewy(
                    fontSize: 28,
                    color: Colors.teal.shade700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 30, color: Colors.black),
                )
              ],
            ),
          ),

          /// Pet in Center with selected accessory
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/bunny1.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,

                ),
                if (selectedAccessory != null)
                  Image.asset(
                    selectedAccessory!,
                    height: 120,
                  ),
              ],
            ),
          ),

          /// Accessories Scroll
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: accessories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  final item = accessories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAccessory = item["image"];
                      });
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selectedAccessory == item["image"]
                              ? Colors.teal
                              : Colors.transparent,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item["image"]!,
                            height: 60,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item["name"]!,
                            style: GoogleFonts.chewy(
                              fontSize: 16,
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
