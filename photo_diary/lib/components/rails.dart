import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rails extends StatelessWidget {
  Rails({Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);

  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
      top: this.top,
      bottom: this.bottom,
      left: this.left,
      child: new Container(
        height: double.infinity,
        width: 2.0,
        color: Colors.grey[850],
      ),
    );
  }
}
