import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/hexColor.dart';

class Station extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: 50.0,
      left: 15.0,
      child: new Container(
        height: 40.0,
        width: 40.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: new Container(
          height: 20.0,
          width: 20.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: HexColor('#FEFAD4'),
          ),
        ),
      ),
    );
  }
}
