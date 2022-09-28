import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final String errorMessage;
  final onSave;
  final validator;

  CustomTextField(
      this.hint, this.icon, this.errorMessage, this.onSave, this.validator);

  late FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.03),
      child: TextFormField(
        onSaved: onSave,
        validator: validator,
        cursorColor: kMainColor,
        obscureText: hint == 'Enter your password' ? true : false,
        autofocus: hint == 'Enter your password' ? false : true,
        focusNode: hint == 'Enter your password' ? passwordFocusNode : null,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: hint != 'Enter your password'
            ? (term) {
                passwordFocusNode.requestFocus();
              }
            : null,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: kMainColor,
          ),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
