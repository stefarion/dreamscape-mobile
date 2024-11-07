import 'package:flutter/material.dart';
import 'package:dreamscape_mobile/screens/menu.dart';
import 'package:dreamscape_mobile/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF0e1b4d),
      child: ListView(
        children: [
          DrawerHeader(
            // Bagian drawer header
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Dreamscape Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Tahoma',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Level Up Your Gameplay with\nHonkai: Star Rail Merchandise!",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Tahoma',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
            // Bagian routing
            ListTile(
              leading: const Icon(Icons.home_outlined, color: Colors.white),
              title: const Text(
                'Home Page', 
                style: TextStyle(color: Colors.white, fontFamily: 'Tahoma')
              ),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_sharp, color: Colors.white),
              title: const Text(
                'Add Product', 
                style: TextStyle(color: Colors.white, fontFamily: 'Tahoma')
              ),
              // Bagian redirection ke MoodEntryFormPage
              onTap: () {
                /*
                Routing ke MoodEntryFormPage
                */
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductEntryFormPage(),
                    ));
              },
            ),
        ],
      ),
    );
  }
}