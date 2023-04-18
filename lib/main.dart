import 'package:animated_splash_screen/animated_splash_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:gpt_flutter/screens/home.dart';
import 'package:gpt_flutter/screens/home_screen.dart';
import 'package:gpt_flutter/screens/translator.dart';
import 'constants/colors.dart';
import 'models/todo.dart';
import 'providers/active_theme_provider.dart';
import 'screens/chat_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/intro_screen.dart';
import 'constants/themes.dart';
import 'screens/image_generator.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Container(
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
        
        home: IntroScreen(
          splash: Image.asset(
            'assets/img1.jpg',
          ),
          nextScreen: HomeScreen(),
          splashTransition: SplashTransition.sizeTransition,
          duration: 30000,
        ), //
      ),
    );
  }
}


