import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_companion/Utils/colorPalete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class petSelectionScreen extends StatefulWidget {
  const petSelectionScreen({super.key});

  @override
  State<petSelectionScreen> createState() => _petSelectionScreenState();
}

class _petSelectionScreenState extends State<petSelectionScreen> {

  final searchController = TextEditingController();
  String selectedCategory = 'All';
  bool isMale = true;
  int? selectedPetIndex;

  double xOffSet = 0;
  double yOffSet = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;



  final List<Map<String, String>> pets = [
    {"name": "Kitty", "animation": "assets/lottie/cat1.json",},
    {"name": "Puppy", "animation": "assets/lottie/dog.json",},
    {"name": "Bunny", "animation": "assets/lottie/bunny1.json",},
    {"name": "Flopy", "animation": "assets/lottie/parrot.json",}
  ];



  @override
  Widget build(BuildContext context) {
    return
      AnimatedContainer(duration: Duration(microseconds: 250),
        transform: Matrix4.translationValues(xOffSet, yOffSet, 0)..scale(scaleFactor),

        color: AppColors.background,
        child: Column(
          children: [


            Container(
              color: AppColors.primaryColor,
              height: 90,

              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    isDrawerOpen ? IconButton(onPressed: (){
                      setState(() {
                        xOffSet= 0;
                        yOffSet= 0;
                        scaleFactor = 1;
                        isDrawerOpen = false;
                      });
                    }, icon: Icon(Icons.arrow_back_ios,
                      color: Colors.white,)
                    ):IconButton(onPressed: (){

                      setState(() {
                        xOffSet= 230;
                        yOffSet= 150;
                        scaleFactor = 0.6;
                        isDrawerOpen = true;
                      });
                    }, icon:Icon(Icons.menu,
                      color: Colors.white,)
                    ),
                    SizedBox(width: 50,),
                    Text(
                      textAlign: TextAlign.center,
                      "Choose your Pet",
                      style: GoogleFonts.chewy(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 pets per row
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    final pet = pets[index];
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPetIndex = index; // keep track of selected pet
                          });
                          // Navigate to Home Screen or Save Selected Pet
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBackground,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Lottie.asset(
                          pet["animation"]!,
                            fit: BoxFit.contain,
                                  // animations: [
                                  //   selectedPetIndex == index
                                  //       ? pet["happy"]!   //  play happy animation if selected
                                  //       : pet["idle"]!    //  otherwise idle
                                  // ],
                          ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                pet["name"]!,
                                style: GoogleFonts.fredoka(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Select Pet Action
                                  },
                                  child: Text(
                                    "Select",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    );

                  }
              ),
            )




          ],
        ),
      );
  }
}
