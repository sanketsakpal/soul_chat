import 'package:go_router/go_router.dart';
import 'package:soul_chat/features/auth/screens/login_screen.dart';
import 'package:soul_chat/features/auth/screens/otp_screen.dart';
import 'package:soul_chat/features/landing/screens/landing_screen.dart';
import 'package:soul_chat/routes/route_name.dart';

GoRouter router = GoRouter(
  initialLocation: '/landing',
  routes: <RouteBase>[
    GoRoute(
      name: '/landing',
      path: RouteName.landing,
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      name: '/login',
      path: RouteName.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: '/otp',
      path: RouteName.otp,
      builder: (context, state) => const OtpScreen(),
    )
  ],
);
