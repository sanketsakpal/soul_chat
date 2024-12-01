import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/common/widgets/custom_button.dart';
import 'package:soul_chat/routes/route_name.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Welcome to WhatsApp',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height / 9),
          Image.asset(
            'assets/bg.png',
            height: 340,
            width: 340,
            color: tabColor,
          ),
          SizedBox(height: size.height / 9),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
              style: TextStyle(color: greyColor),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width * 0.75,
            child: CustomButton(
              text: 'AGREE AND CONTINUE',
              onPressed: () => context.pushNamed(RouteName.login),
            ),
          )
        ],
      )),
    );
  }
}
