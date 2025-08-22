import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_companion/Utils/colorPalete.dart';

class petSelectionScreen extends StatefulWidget {
  const petSelectionScreen({super.key});

  @override
  State<petSelectionScreen> createState() => _petSelectionScreenState();
}

class _petSelectionScreenState extends State<petSelectionScreen> {

  final searchController = TextEditingController();
  String selectedCategory = 'All';
  bool isMale = true;



  Widget buildCategorySelection(){
    final categories = [
      {'name': 'All', 'icon': Icons.all_inclusive_sharp,},
      {'name': 'Cats', 'icon': FontAwesomeIcons.cat,},
      {'name': 'Dogs', 'icon': FontAwesomeIcons.dog,},
      {'name': 'Parrots', 'icon':FontAwesomeIcons.kiwiBird ,},
      {'name': 'Rabbits', 'icon': FontAwesomeIcons.paw,},
    ];
    return Container(
        height: 120,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedCategory == category['name'];
              return Container(
                margin: EdgeInsets.only(right: 12),
                child:
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = category['name'] as String;
                    });

                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                      width: 80,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : AppColors.primaryColor,
                            width: 2.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),

                          ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Icon(category['icon'] as IconData, color: isSelected ? Colors.white : AppColors.primaryColor,),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            category['name'] as String,
                            style: TextStyle(
                              color: isSelected ? Colors.white : AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )

                  ),

                ),

              );


            }
        )
    );
  }

  Widget buildPetSelection(){
    final categories = [
      {'name': 'Sola','Age': '1.2 years','breed':'Abyssinian cat', 'distance':'3.5 KM' ,'isMale': true,'image': 'images/cat1.png'},
      {'name': 'Dogs','Age': '5 months years','breed':'Abyssinian cat', 'distance':'3.5 KM' ,'isMale': false,'image': 'images/dog1.png' },
      {'name': 'Parrots', 'Age': ' 2 months','breed':'Abyssinian cat', 'distance':'3.5 KM','isMale': false,'image': 'images/parrot1.png' },
      {'name': 'Rabbits','Age': '1 years','breed':'Abyssinian cat', 'distance':'3.5 KM','isMale': false, 'image': 'images/rabbit1.png'},

    ];
    return Container(
        height: 400,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                height: 240,
                margin: EdgeInsets.symmetric(horizontal: 20),

                child: Row(
                  children: [
                    Expanded(child:Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),

                          decoration: BoxDecoration(
                              color: Colors.blueGrey[300],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ]

                          ),
                          child: Align(
                            child: ClipRect(
                              child: Image.asset(
                                category['image'] as String,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ) ),
                    Expanded(
                        child:Container(

                          margin: EdgeInsets.only(top: 60, bottom: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ]
                          ),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Name + Gender
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        category['name']?.toString() ?? "",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Icon(
                                        (category['isMale'] == true)
                                            ? FontAwesomeIcons.mars
                                            : FontAwesomeIcons.venus,
                                        size: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  category['breed']?.toString() ?? "Unknown Breed",
                                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  category['Age']?.toString() ?? "Unknown Age",
                                  style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                                ),
                                Spacer(),
                                // Distance
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FontAwesomeIcons.locationDot,
                                        size: 14, color: AppColors.primaryColor),
                                    SizedBox(width: 6),
                                    Text(
                                      category['distance']?.toString() ?? "N/A",
                                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        )
                    ),
                  ],
                ),
              );





            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
