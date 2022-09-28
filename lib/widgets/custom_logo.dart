import 'package:flutter/material.dart';

import '../constants.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: deviceSize.height * 0.01),
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/hotel.png'),
          ),
          Text(
            'B-Hotels',
            style: TextStyle(
                fontFamily: 'Lobster', fontSize: deviceSize.height * 0.04),
          ),
        ],
      ),
    );
  }
}
