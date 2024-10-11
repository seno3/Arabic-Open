import 'package:arabic_open/pages/alphabets.dart';
import 'package:arabic_open/pages/flashcards.dart';
import 'package:arabic_open/pages/unitpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState((){
      _selectedIndex = index;
    });
  }
  
  final List _pages = [
    UnitPage(),
    const FlashCardPage(),
    const AlphabetsPage(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(children: [

          
          DrawerHeader(
            child: Image.asset('lib/images/dps_dubai_logo_trans.png'),
            
            ),
            // home page
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                  // go to home
                  Navigator.pushNamed(context, '/home');
                },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("Back"),
              onTap:(){
                 Navigator.pop(context);
                 Navigator.pushNamed(context, '/welcome');
                 },
            ),
        ],)

      ),
      
      
      body: Column(children: [
        Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
    
                    Builder(builder: (context) => IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 45,
                        color: Colors.grey[800],
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                    ),
                    ),
    
              
                ],),
              ),
        Expanded(child: _pages[_selectedIndex]),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_membership_outlined),
          label: 'Flashcards',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_membership_outlined),
          label: 'Alphabets',
          ),

      ]),
      );

  }
}