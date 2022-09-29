import 'dart:developer';

import 'package:bhotels/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../widgets/custom_logo.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

// Future Provider to get all data we need from Database without any issues
final userFutureProvider = FutureProvider(
  (ref) async {
    final selected =
        await ref.read(branchChangeNotifierProvider).getAllBranches();
    await ref.read(guestChangeNotifierProvider).getAllGuests();
    await ref.read(roomChangeNotifierProvider).getAllRooms();
    await ref.read(roomTypeChangeNotifierProvider).getAllRoomTypes();
    await ref.read(reservationChangeNotifierProvider).getAllReservations();
    await ref.read(roomReservedChangeNotifierProvider).getAllRoomsReserved();
    await ref
        .read(reservationCatalogChangeNotifierProvider)
        .getAllResCatalogs();
    return selected;
  },
);

class WelcomeScreen extends ConsumerWidget {
  // Creating global key to use it in the Form
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  // TextEdittingController for all fields
  TextEditingController emailTextEditingController = TextEditingController();

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    // Instance of all providers we need
    var futureProvider = watch(userFutureProvider);
    var guestProvider = watch(guestChangeNotifierProvider);
    return futureProvider.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
        ),
        backgroundColor: kMainColor,
        body: Form(
          key: _globalKey,
          child: ListView(
            children: [
              const CustomLogo(),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Center(child: CustomText('Login', deviceSize.height * 0.03)),
              SizedBox(
                height: deviceSize.height * 0.03,
              ),
              CustomTextField(
                'Email',
                Icons.email,
                (value) {
                  emailTextEditingController.text = value;
                },
                (value) {
                  if (value.isEmpty) {
                    return 'E-mail is empty';
                  } else if (emailTextEditingController.text !=
                      guestProvider.guest.guestEmail) {
                    log(guestProvider.guest.guestEmail);
                    return 'Wrong Email, Try again!';
                  }
                },
              ),
              SizedBox(
                height: deviceSize.height * 0.03,
              ),
              CustomTextField(
                'Password',
                Icons.lock,
                (value) {},
                (value) {
                  if (value.isEmpty) {
                    return 'Password is empty';
                  }
                },
              ),
              SizedBox(
                height: deviceSize.height * 0.06,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(deviceSize.height * 0.07),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                  },
                  child: CustomText('Login', deviceSize.height * 0.02,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      'Don\'t have an account ? ', deviceSize.height * 0.02,
                      color: Colors.white),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: deviceSize.height * 0.02),
                    ),
                  ),
                ],
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
