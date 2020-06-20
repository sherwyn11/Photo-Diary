import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/components/newFriendAdd.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/hexColor.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatefulWidget {
  Credits({Key key}) : super(key: key);
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Credits> {
  final url = "https://github.com/sherwyn11/Photo-Diary";

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Note from the creator...',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(letterSpacing: 2.0, fontSize: 20.0),
                ),
              ),
              Divider(
                height: 10.0,
                color: Colors.grey,
              ),
              Container(
                child: Text(
                  'We all have a few special people in our lives...With whom we cherish amazing moments...This app is for those who like to treasure their moments with their loved ones...on the go\n\n- Sherwyn D\'souza',
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                width: 250.0,
              ),
              Divider(
                height: 10.0,
                color: Colors.grey,
              ),
              Container(
                child: Text(
                  'This project was made using Flutter and Firebase is open-sourced on GitHub',
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 18.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
                width: 250.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: HexColor('#8FB9A8'),
                    child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: FaIcon(FontAwesomeIcons.github),
                      onPressed: () async {
                        await launch(url);
                      },
                    ),
                  ),
                  FloatingActionButton(
                    elevation: 4.0,
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => NewFriendDialog(),
                      );
                    },
                    backgroundColor: HexColor('#8FB9A8'),
                    child: Icon(
                      Icons.share,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
