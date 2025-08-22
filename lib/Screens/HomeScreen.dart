import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_companion/Utils/colorPalete.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final double health = 0.8;   // 80%
  final double happiness = 0.6; // 60%
  final double hunger = 0.3; // 30%







  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.white, size: 22,),
            SizedBox(width: 110,),
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
      body:
      SingleChildScrollView( // in case content overflows
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 20,),
            // Pet Image
            Container(
              child: Image.asset(
                'images/cat1.png',
                fit: BoxFit.cover,
              ),
            ),

            // Stats Container
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.smile, color: AppColors.primaryColor,),
                      SizedBox(width: 10),
                      Text(
                        "Happiness",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.7, // example value
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor),
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.orange[200],),
                      SizedBox(width: 10),
                      Text(
                        "Health",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value:health, // example value
                          backgroundColor: Colors.grey[300],
                         valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orange[200]!),
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.set_meal, color: Colors.red[200],),
                      SizedBox(width: 10),

                      Text(
                        "Hunger",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: hunger, // example value
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red[200]!),
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                      onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.set_meal, color: Colors.white,),
                      SizedBox(width: 5,),

                      Text("Feed", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  )),

                  SizedBox(width: 5,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                      onPressed: (){}, child: Row(
                    children: [
                      Icon(Icons.set_meal, color: Colors.white,),
                      SizedBox(width: 10,),

                      Text("Feed", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  )),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),

                      ),
                      onPressed: (){}, child: Row(
                    children: [
                      Icon(Icons.set_meal, color: Colors.white,),
                      SizedBox(width: 10,),

                      Text("Feed", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
