import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/utils/hexColor.dart';

import '../utils/hexColor.dart';

class Diary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: HexColor("#FCD0BA"),
      appBar: AppBar(
        title: Text(
          'Save a Memory...',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: HexColor("#8FB9A8"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Card(
                child: Container(
                  height: 400.0,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(7.0, 20.0, 7.0, 96.0),
                    child: Image.network(
                      'https://cdn.pastemagazine.com/www/articles/2020/04/23/the1975againagainmain.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                elevation: 4.0,
              ),
              Positioned(
                left: -200,
                right: 0,
                bottom: 360,
                top: 0,
                child: Transform.rotate(
                  angle: -pi / 4,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    height: 40,
                    width: 200,
                    color: Colors.grey[100].withOpacity(0.8),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: -200,
                bottom: 0,
                top: 360,
                child: Transform.rotate(
                  angle: -pi / 4,
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    height: 40,
                    width: 200,
                    color: Colors.grey[100].withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Date: ',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Dear Diary, ',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
