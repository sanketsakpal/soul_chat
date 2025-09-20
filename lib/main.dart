import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soul_chat/colors.dart';
import 'package:soul_chat/firebase_options.dart';
import 'package:soul_chat/routes/route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator("10.0.2.2", 9099);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: appBarColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: backgroundColor,
      ),
      routerConfig: router,
      // routeInformationParser: RouteConfig().router.routeInformationParser,
      // routeInformationProvider: RouteConfig().router.routeInformationProvider,
      // routerDelegate: RouteConfig().router.routerDelegate,
      // home: const LandingScreen()

      // const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayoutScreen(),
      //   webScreenLayout: WebLayoutScreen(),
      // ),
    );
  }
}
