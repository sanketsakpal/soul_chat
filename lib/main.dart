import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soul_chat/Screens/mobile_layout_screen.dart';
import 'package:soul_chat/Screens/web_layout_screen.dart';
import 'package:soul_chat/Utils/responsive_layout.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/features/landing/screens/landing_screen.dart';
import 'package:soul_chat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp UI',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: const LandingScreen()

        // const ResponsiveLayout(
        //   mobileScreenLayout: MobileLayoutScreen(),
        //   webScreenLayout: WebLayoutScreen(),
        // ),
        );
  }
}