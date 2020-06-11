import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/components/tape.dart';
import 'package:photo_diary/utils/hexColor.dart';

import '../utils/hexColor.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
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
      body: SingleChildScrollView(
        child: Column(
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
                Tape(top: 0, right: 0, bottom: 360, left: -200),
                Tape(top: 360, right: -200, bottom: 0, left: 0),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'The oldest classical Greek and Latin writing had little or no space between words and could be written in boustrophedon (alternating directions). Over time, text direction (left to right) became standardized, and word dividers and terminal punctuation became common. The first way to divide sentences into groups was the original [[paragraphos|parágraphos]], similar to an underscore at the beginning of the new group.[2] The Greek parágraphos evolved into the pilcrow (¶), which in English manuscripts in the Middle Ages can be seen inserted inline between sentences. The hedera leaf (e.g. ☙) has also been used in the same way.',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
