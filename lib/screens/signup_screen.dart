import 'package:bhotels/main.dart';
import 'package:bhotels/models/guest_model.dart';
import 'package:bhotels/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../widgets/custom_logo.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class SignupScreen extends ConsumerWidget {
  // Creating global key to use it in the Form
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  // TextEdittingController for all fields
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    // Instance of all providers we need
    var guestProvider = watch(guestChangeNotifierProvider);
    var reservationsProvider = watch(reservationChangeNotifierProvider);
    return Scaffold(
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
            Center(
              child: CustomText('Sign Up', deviceSize.height * 0.03),
            ),
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
            CustomTextField(
              'First name',
              Icons.person,
              (value) {
                firstNameTextEditingController.text = value;
              },
              (value) {
                if (value.isEmpty) {
                  return 'Field is empty';
                }
              },
            ),
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
            CustomTextField(
              'Last name',
              Icons.person,
              (value) {
                lastNameTextEditingController.text = value;
              },
              (value) {
                if (value.isEmpty) {
                  return 'Field is empty';
                }
              },
            ),
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
                } else if (!value.contains('@')) {
                  return 'E-mail format is not correct';
                }
              },
            ),
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
            CustomTextField(
              'Phone number',
              Icons.phone,
              (value) {
                phoneTextEditingController.text = value;
              },
              (value) {
                if (value.isEmpty) {
                  return 'Field is empty';
                }
              },
            ),
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
            CustomTextField(
              'Address',
              Icons.location_pin,
              (value) {
                addressTextEditingController.text = value;
              },
              (value) {
                if (value.isEmpty) {
                  return 'Field is empty';
                }
              },
            ),
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
            CustomTextField(
              'Password',
              Icons.lock,
              (value) {
                passwordTextEditingController.text = value;
              },
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
              padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(deviceSize.height * 0.07),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  _globalKey.currentState!.save();
                  if (_globalKey.currentState!.validate()) {
                    // Creating new guest
                    Guest newGuest = Guest(
                        id: DateTime.now().microsecondsSinceEpoch,
                        firstName: firstNameTextEditingController.text,
                        lastName: lastNameTextEditingController.text,
                        guestEmail: emailTextEditingController.text,
                        guestPhone: phoneTextEditingController.text,
                        address: addressTextEditingController.text,
                        details: 'No current details',
                        hasPreviousBooking: false);
                    // Insert Guest into provider and Database
                    guestProvider.insertNewGuest(newGuest);
                    // Clear all previous user reservations
                    reservationsProvider.clearReservations();
                    // Welcome message
                    customSnackBar('Welcome to B-Hotels!');
                    // Navigate to Home Screen
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', ModalRoute.withName(''));
                  }
                },
                child: CustomText('Sign Up', deviceSize.height * 0.02,
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
                    'Already have an account ? ', deviceSize.height * 0.02,
                    color: Colors.white),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: deviceSize.height * 0.02),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
