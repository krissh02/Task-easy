import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpt_flutter/models/todo.dart';
import 'package:gpt_flutter/screens/chat_screen.dart';
// import 'package:gpt_flutter/screens/hoenew.dart';
import 'package:gpt_flutter/screens/image_generator.dart';
import 'package:gpt_flutter/screens/translator.dart';
import 'package:gpt_flutter/widgets/todo_item.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get child => null;
  int _selectedIndex = 0;  

  List<Widget> mylist = [
    Home(),
    ChatScreen(),
    ImageGeneratorScreen(),
    Home(),
    TranslatorDemo(),
  ];

    void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 103, 249, 1), // elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TASK-EASY',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/img1.jpg'),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('WELCOME GUYS',
                    textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        fontFamily: ' Disposable Droid BB',
                        color: Color.fromARGB(255, 35, 195, 201)),
                    speed: Duration(milliseconds: 100)),
                TypewriterAnimatedText('TO AI PLANET!',
                    textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        fontFamily: ' Disposable Droid BB',
                        color: Color.fromARGB(255, 35, 195, 201)),
                    speed: Duration(milliseconds: 100)),
                TypewriterAnimatedText('How Can I Assist You!!',
                    textStyle: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        fontFamily: ' Disposable Droid BB',
                        color: Color.fromARGB(255, 35, 195, 201)),
                    speed: Duration(milliseconds: 200)),
              ],
            ),
          ),
          Center(
            // ),
            child: Container(
                height: 500, width: 700, child: Image.asset('assets/img3.gif')),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
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
      ),
    );
  }
}

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gpt_flutter/models/todo.dart';
// import 'package:gpt_flutter/screens/chat_screen.dart';
// import 'package:gpt_flutter/screens/image_generator.dart';
// import 'package:gpt_flutter/screens/translator.dart';
// import 'package:gpt_flutter/widgets/todo_item.dart';

// import 'home.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor:
//               const Color.fromRGBO(35, 103, 249, 1), // elevation: 0,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('TASK-EASY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),
//               Container(
//                 height: 40,
//                 width: 40,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.asset('assets/img1.jpg'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.white,
//         color: Color.fromRGBO(35, 103, 249, 1),
//         //  color: Colors.white,
//         animationDuration: Duration(milliseconds: 200),
//         items: [
//           IconButton(
//             icon: Icon(Icons.home),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const HomeScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.chat),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ChatScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.image_search_outlined),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ImageGeneratorScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.today_outlined),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Home()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.g_translate_outlined),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => TranslatorDemo()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen1 extends StatelessWidget {
//   const HomeScreen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'TASK-EASY',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(35, 103, 249, 1),
//       ),
//       // body: Center(child: Text("HomeScreen"),),
//     );
//   }
// }

// class ChatScreen1 extends StatelessWidget {
//   const ChatScreen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       // Do something when the user taps
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ChatScreen()),
//       );
//     },
//     child: Scaffold(
      
//     ),
//   );
// }
// }
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'TASK-EASY',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(35, 103, 249, 1),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'Choose what you want to try !!!',
//               style: TextStyle(fontSize: 24, color: Colors.black),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ChatScreen()),
//                   );
//                 },
//                 child: const Icon(
//                   Icons.message,
//                   size: 20,
//                   color: Colors.white,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromRGBO(19, 10, 110, 1),
//                   fixedSize: const Size(30, 30),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => ImageGeneratorScreen()),
//                   );
//                 },
//                 child: const Icon(
//                   Icons.image,
//                   size: 20,
//                   color: Colors.white,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(30, 30),
//                     backgroundColor: const Color.fromRGBO(19, 10, 110, 1)),
//               ),
//               const SizedBox(height: 10),
//                ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => TranslatorDemo()),
//                   );
//                 },
//                 child: const Icon(
//                   Icons.g_translate_outlined,
//                   size: 17,
//                   color: Colors.white,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(20, 20),
//                     backgroundColor: const Color.fromRGBO(19, 10, 110, 1)),
//               ),
//                const SizedBox(height: 10),
//             ]
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Text('ChatSpeakAI',
//                     style: TextStyle(fontSize: 10, color: Colors.black)),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Text('SNAPAI',
//                     style: TextStyle(fontSize: 10, color: Colors.black)),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
//                 child: Text('TRANSLATE',
//                     style: TextStyle(fontSize: 10, color: Colors.black)),
//               )
//             ],
//           )
//           ],
//           ),
//       );
//   }
// }
