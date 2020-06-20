import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ballast extends StatelessWidget {
  Ballast({Key key, this.left, this.top}) : super(key: key);

  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: this.top,
      left: this.left,
      child: new Container(
        height: 10.0,
        width: 40.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: new Container(
//                      margin: new EdgeInsets.all(5.0),
          height: 1.0,
          width: 1.0,
          decoration:
              new BoxDecoration(shape: BoxShape.rectangle, color: Colors.grey),
        ),
      ),
    );
  }
}
