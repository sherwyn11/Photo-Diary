import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/utils/hexColor.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({@required this.name});

  final name;

  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 40.0,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        name,
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: HexColor("#8FB9A8"),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Log Out',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.popAndPushNamed(context, '/login');
            },
          ),
          Center(
            child: Container(
              color: Colors.black54,
              height: 0.75,
              width: 275.0,
            ),
          ),
        ],
      ),
    );
  }
}
