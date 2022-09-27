import 'package:bhotels/providers/branches_provider.dart';
import 'package:bhotels/providers/guest_provider.dart';
import 'package:bhotels/screens/home_screen.dart';
import 'package:bhotels/screens/auth_screen.dart';
import 'package:bhotels/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Change notifier provider for BranchProvider
final guestChangeNotifierProvider =
    ChangeNotifierProvider<GuestProvider>((ref) => GuestProvider());
// Change notifier provider for BranchProvider
final branchChangeNotifierProvider =
    ChangeNotifierProvider<BranchesProvider>((ref) => BranchesProvider());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => const WelcomeScreen(),
        '/home': (ctx) => const HomeScreen(),
        '/signup': (ctx) => AuthScreen(),
      },
    );
  }
}
