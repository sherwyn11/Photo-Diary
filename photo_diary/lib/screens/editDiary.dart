import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hexColor.dart';

class EditDiaryPage extends StatefulWidget {
  EditDiaryPage({Key key, this.date}) : super(key: key);
  final String date;

  @override
  _EditDiaryPageState createState() => _EditDiaryPageState();
}

class _EditDiaryPageState extends State<EditDiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit a Memory...',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: HexColor("#8FB9A8"),
      ),
      body: Text('Edit Page'),
    );
  }
}
