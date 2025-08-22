import 'package:flutter/material.dart';
import 'package:pet_companion/Screens/HomeScreen.dart';
import 'package:pet_companion/Utils/colorPalete.dart';

class Drawerscreen extends StatefulWidget {
  const Drawerscreen({super.key});

  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.pets, color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("Pet Companion", style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 130,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(

                  children: [
                    Icon(Icons.home,
                      color: Colors.white,
                      size: 22,
                    ),
                    SizedBox(width: 10,),
                    Text("Home", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(

                children: [
                  Icon(Icons.favorite,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10,),
                  Text("pet stats", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(

                children: [
                  Icon(Icons.volunteer_activism,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10,),
                  Text("Care Actions", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(

                children: [
                  Icon(Icons.catching_pokemon,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10,),
                  Text("Pet Selection", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(

                children: [
                  Icon(Icons.settings,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10,),
                  Text("Settings", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
            SizedBox(height: 180,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child:
              Row(

                children: [
                  Icon(Icons.info_outline,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10,),

                  Text("About", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 20,),
                  Container(
                    width: 1,          // line thickness
                    height: 20,        // line length
                    color: Colors.white70, // line color
                  ),
                  SizedBox(width: 20,),
                  Icon(Icons.logout,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10,),
                  Text("Logout", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
