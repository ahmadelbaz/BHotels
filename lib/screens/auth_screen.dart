import 'package:bhotels/main.dart';
import 'package:bhotels/models/guest_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  TextEditingController tec = TextEditingController();
  // const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    var branchProvider = watch(branchChangeNotifierProvider);
    var guestProvider = watch(guestChangeNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            TextField(
              controller: tec,
            ),
            ElevatedButton(
              onPressed: () {
                Guest newGuest = Guest(
                  id: DateTime.now().microsecondsSinceEpoch,
                  firstName: tec.text,
                  lastName: 's',
                  guestEmail: ' g@g.com',
                  guestPhone: '+2123456789',
                  address: 'zagaig second floor',
                  details: 'No details found',
                  hasPreviousBooking: false,
                );
                guestProvider.insertNewGuest(newGuest);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
