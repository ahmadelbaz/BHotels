import 'package:bhotels/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../widgets/custom_logo.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

final userFutureProvider = FutureProvider(
  (ref) async {
    final selected =
        await ref.read(branchChangeNotifierProvider).getAllBranches();
    await ref.read(guestChangeNotifierProvider).getAllGuests();
    await ref.read(roomChangeNotifierProvider).getAllRooms();
    await ref.read(roomTypeChangeNotifierProvider).getAllRoomTypes();
    return selected;
  },
);

class WelcomeScreen extends ConsumerWidget {
  // Creating global key to use it in the Form
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, watch) {
    var futureProvider = watch(userFutureProvider);
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
              CustomTextField('Enter your email', Icons.email,
                  'E-mail is empty', (value) {}, (value) {
                if (value == null) {
                  print("ERROR");
                }
              }),
              SizedBox(
                height: deviceSize.height * 0.03,
              ),
              CustomTextField('Enter your password', Icons.lock,
                  'Password is empty', (value) {}, (value) {
                if (value == null) {
                  print("ERROR");
                }
              }),
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
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      //do something
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
                      // Get.to(() => RegisterScreen());
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
