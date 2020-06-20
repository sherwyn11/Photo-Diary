import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/databaseWork.dart';
import 'package:photo_diary/utils/hexColor.dart';

class NewFriendDialog extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();

  dialogContent(BuildContext context) {
    return Container(
      height: 300.0,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Add a new Friend!',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              maxLines: 1,
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  letterSpacing: 2.0,
                ),
              ),
              controller: _textEditingController,
            ),
          ),
          RaisedButton(
            onPressed: () async {
              bool done =
                  await Db().saveFriend(uidConst, _textEditingController.text);
              if (done) {
                Navigator.pop(context);
              } else {
                Fluttertoast.showToast(
                  msg: "User doesn't have an account!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                );
              }
            },
            color: HexColor('#8FB9A8'),
            child: Text(
              'Add!',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 2.0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }
}
