import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/utils/hexColor.dart';

class Diary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        children: <Widget>[
          Card(
            child: Container(
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 32.0),
                child: Image.network(
                  'https://media-exp1.licdn.com/dms/image/C5603AQFspvURYWqaJQ/profile-displayphoto-shrink_200_200/0?e=1596067200&v=beta&t=-9Hd7pM2BhRdkkErxz30CjTPoWv9tiwAd3Zi2h0MNuk',
                ),
              ),
            ),
            elevation: 8.0,
          ),
        ],
      ),
    );
  }
}
