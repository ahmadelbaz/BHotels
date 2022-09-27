import 'package:bhotels/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userFutureProvider = FutureProvider(
  (ref) async {
    final selected = await ref.read(branchChangeNotifierProvider).getAllModes();
    await ref.read(guestChangeNotifierProvider).getAlGuests();
    return selected;
  },
);

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    var futureProvider = watch(userFutureProvider);
    return futureProvider.when(
      data: (data) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const Text('Start'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
