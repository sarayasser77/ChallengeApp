import 'package:challengeapp/Screens/HomeScreen/HomeScreen.dart';
import 'package:challengeapp/Screens/favScreen/fav.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget{
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentindex=0;
  List Screens=[HomeScreen(),HomeScreen(),FavScreen(),HomeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Screens[currentindex],
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex:currentindex,
          onTap: (int index){
            currentindex=index;
            setState(() {
            }
            );
          },
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueGrey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.language),label: 'lang'),
            BottomNavigationBarItem(icon: Icon(Icons.save),label: 'saved'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'profile'),

          ],
        )
    );
  }
}