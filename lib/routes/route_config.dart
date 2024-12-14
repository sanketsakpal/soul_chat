import 'package:go_router/go_router.dart';
import 'package:soul_chat/features/auth/screens/login_screen.dart';
import 'package:soul_chat/features/auth/screens/otp_screen.dart';
import 'package:soul_chat/features/landing/screens/landing_screen.dart';
import 'package:soul_chat/routes/route_name.dart';

GoRouter router = GoRouter(
  initialLocation: '/landing',
  routes: <RouteBase>[
    GoRoute(
      name: RouteName.landing,
      path: '/landing',
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
        return OtpScreen(
          otp: otp,
        );
      },
    )
  ],
);
