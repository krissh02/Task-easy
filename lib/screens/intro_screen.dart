import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key, required Image splash, required SplashTransition splashTransition, required HomeScreen nextScreen, required int duration}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'TASK EASY',
      body: "A little bored? \nCome talk with AI chat",
  image: Center(
    child: Container(
      decoration: BoxDecoration(
         boxShadow: [
          BoxShadow(
            // color: Color.fromARGB(255, 27, 26, 26).withOpacity(0.8),
            color: Color.fromARGB(255, 58, 94, 195).withOpacity(0.6),
            blurRadius: 15.0,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.black,
          width: 4.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(
        'assets/logo.jpeg', 
        fit: BoxFit.cover,
      ),
    ),
  ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
    ),
      ),
    ),
    PageViewModel(
        title: 'CHATSPEAKAI',
        body: 'Get answers to all you queries at the tip of your finger !!!',
        image: Expanded(
          child: Image.asset('assets/1.gif',height: 300, width: 300,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
    ),
        )
    ),
    PageViewModel(
        title: 'SNAPAI',
        body: "See the Image-Generating Capabilities of Open-AI",
        image: Center(
          child: Image.asset('assets/2.jpg', height: 500,width: 450,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
    ),
        )
    ),
    PageViewModel(
        title: 'TODOLIST',
        body: "Subtracting from your list of priorities is as important as adding to it.",
        image: Center(
          child: Image.asset('assets/todo.gif', height: 500,width: 450,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
    ),
        )
    ),
    PageViewModel(
        title: 'TRANSLATEAI',
        body: "Without translation, we would be living in provinces bordering on silence!!! \n\nLets Go!",
        image: Center(
          child: Image.asset('assets/translate.gif',height: 500, width: 450,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
    ),
        )
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TASK-EASY',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(35, 103, 249, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 75, 12, 15),
          child: IntroductionScreen(
            pages: pages,
            globalBackgroundColor:  Colors.white,
            dotsDecorator: const DotsDecorator(
              size: Size(6,6),
              color: Color.fromRGBO(138, 125, 255, 0.549),
              // color: Color.fromARGB(17, 30, 40, 238),
              activeSize: Size.square(13),
              activeColor: Color.fromRGBO(35, 103, 249, 1),
            ),
            showDoneButton: true,
            done: const Text('Done', style: TextStyle(fontSize: 20,color: Colors.black),),
            showSkipButton: true,
            skip: const Text('Skip', style: TextStyle(fontSize: 20,color: Colors.black),),
            showNextButton: true,
            next: const Icon(Icons.arrow_forward_ios_rounded, size: 25,color: Colors.black),
            onDone: () => onDone(context),
            curve: Curves.bounceOut,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()));
  }
}