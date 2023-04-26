

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gpt_flutter/screens/translator.dart';

import '../screens/chat_screen.dart';
import '../screens/home.dart';
import '../screens/home_screen.dart';
import '../screens/image_generator.dart';

class BottomNavCiustomWidget extends StatefulWidget {
  const BottomNavCiustomWidget({super.key});

  @override
  State<BottomNavCiustomWidget> createState() => _BottomNavCiustomWidgetState();
}

class _BottomNavCiustomWidgetState extends State<BottomNavCiustomWidget> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromRGBO(35, 103, 249, 1),
        //  color: Colors.white,
        animationDuration: Duration(milliseconds: 200),
        items: [
          IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.chat),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.image_search_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageGeneratorScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.today_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.g_translate_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TranslatorDemo()),
              );
            },
          ),
        ],
      )
    ;
  }
}