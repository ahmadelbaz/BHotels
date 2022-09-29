import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final onSave;
  final validator;

  CustomTextField(this.hint, this.icon, this.onSave, this.validator);

  late FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.03),
      child: TextFormField(
        onSaved: onSave,
        validator: validator,
        cursorColor: primaryColor,
        obscureText: hint == 'Password' ? true : false,
        autofocus: hint == 'Password' ? false : true,
        focusNode: hint == 'Password' ? passwordFocusNode : null,
        textInputAction: TextInputAction.next,
        keyboardType: hint == 'Email'
            ? TextInputType.emailAddress
            : hint == 'Phone number'
                ? TextInputType.phone
                : TextInputType.text,
        onFieldSubmitted: hint != 'Password'
            ? (term) {
                passwordFocusNode.requestFocus();
              }
            : null,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: primaryColor,
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
