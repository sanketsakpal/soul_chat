import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:soul_chat/Screens/mobile_chat_screen.dart';
import 'package:soul_chat/Screens/mobile_layout_screen.dart';
import 'package:soul_chat/common/widgets/error_screen.dart';
import 'package:soul_chat/common/widgets/loader.dart';
import 'package:soul_chat/features/auth/screens/login_screen.dart';
import 'package:soul_chat/features/auth/screens/otp_screen.dart';
import 'package:soul_chat/features/auth/screens/user_information_screen.dart';
import 'package:soul_chat/features/auth/controller/auth_controller.dart';

import 'package:soul_chat/features/landing/screens/landing_screen.dart';
import 'package:soul_chat/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:soul_chat/routes/route_name.dart';

// ChangeNotifier to sync Riverpod state with GoRouter
class AuthNotifier extends ChangeNotifier {
  final Ref ref;
  bool isAuthenticated = false;

  AuthNotifier(this.ref) {
    ref.watch(userDataAuthProvider).when(
          data: (data) {
            isAuthenticated = data?.uid != null;
          },
          error: (error, stackTrace) => ErrorScreen(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}

final authNotifierProvider = Provider<AuthNotifier>((ref) {
  return AuthNotifier(ref);
});

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.watch(authNotifierProvider);

  return GoRouter(
    initialLocation: '/landing',
    refreshListenable: authNotifier,
    routes: [
      GoRoute(
        name: RouteName.landing,
        path: '/landing',
        redirect: (context, state) {
          final isAuthenticated = authNotifier.isAuthenticated;

          if (isAuthenticated) {
            return '/MobileLayoutScreen';
          } else {
            return '/landing';
          }
        },
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        name: RouteName.login,
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: RouteName.otp,
        path: '/otp/:otp',
        builder: (context, state) {
          final otp = state.pathParameters['otp'];
          return OtpScreen(otp: otp);
        },
      ),
      GoRoute(
        name: RouteName.userInformation,
        path: '/userInformation',
        builder: (context, state) => const UserInformationScreen(),
      ),
      GoRoute(
        name: RouteName.mobileLayoutScreen,
        path: '/MobileLayoutScreen',
        builder: (context, state) => const MobileLayoutScreen(),
      ),
      GoRoute(
        name: RouteName.selectContactScreen,
        path: '/selectContactScreen',
        builder: (context, state) => const SelectContactsScreen(),
      ),
      GoRoute(
        name: RouteName.mobileChatScreen,
        path: '/mobileChatScreen',
        builder: (context, state) => const MobileChatScreen(),
      ),
    ],
  );
});
