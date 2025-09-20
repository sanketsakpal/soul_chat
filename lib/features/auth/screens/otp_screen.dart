import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/features/auth/controller/auth_controller.dart';

class OtpScreen extends ConsumerWidget {
  final String? verificationId;
  const OtpScreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(
          context,
          verificationId!,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Verifying your number'),
          elevation: 0,
          backgroundColor: backgroundColor,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('We have sent an SMS with a code.'),
              SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: '- - - - - -',
                    hintStyle: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.length == 6) {
                      verifyOTP(ref, context, val.trim());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
