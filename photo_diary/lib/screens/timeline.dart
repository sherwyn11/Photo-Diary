import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/components/ballast.dart';
import 'package:photo_diary/components/bottomAppBarCustom.dart';
import 'package:photo_diary/components/rails.dart';
import 'package:photo_diary/components/stations.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/databaseWork.dart';
import 'package:photo_diary/utils/getDate.dart';
import 'package:photo_diary/utils/hexColor.dart';

import 'diary.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  String otherEmail = otherEmailConst;
  bool loading = false;
  Firestore _db = Firestore.instance;
  String uid = "";

  void getUID() async {
    uid = await Db().getCurrentUserEmail();
    uidConst = uid;
    this.setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUID();

    return Scaffold(
      backgroundColor: HexColor("#FCD0BA"),
      appBar: AppBar(
        title: Text(
          'Your Timeline',
          style: GoogleFonts.pacifico(
            textStyle: TextStyle(
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: HexColor("#8FB9A8"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#8FB9A8"),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DiaryPage(
                date: GetDate().getCurrentDate(),
                text: 'Write something here...',
                imageUrl: null,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: MyBottomAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _db
            .collection('users')
            .document(gestureOne)
            .collection(gestureTwo)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            this.setState(() {
              loading = true;
            });
          }
          final dateSnapshot = snapshot.data.documents;
          List<String> dates = [];
          List<String> texts = [];
          List<String> imageURLS = [];
          for (var datefinal in dateSnapshot) {
            dates.add(datefinal.documentID);
            texts.add(datefinal.data['text']);
            imageURLS.add(datefinal.data['image_url']);
          }
          dates = dates.reversed.toList();
          texts = texts.reversed.toList();
          imageURLS = imageURLS.reversed.toList();
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new Stack(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DiaryPage(
                              date: dates[index],
                              text: texts[index],
                              imageUrl: imageURLS[index],
                            ),
                          ),
                        );
                      },
                      child: new Card(
                        margin: new EdgeInsets.all(20.0),
                        child: new Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Date:',
                                style: GoogleFonts.pacifico(
                                  textStyle: TextStyle(
                                    letterSpacing: 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                dates[index],
                                style: GoogleFonts.pacifico(
                                  textStyle: TextStyle(
                                    letterSpacing: 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: HexColor('#F1828D'),
                          ),
                        ),
                        color: HexColor("#FCD0BA"),
                        elevation: 6.0,
                      ),
                    ),
                  ),
                  Ballast(top: 2.5, left: 15),
                  Ballast(top: 20, left: 15),
                  Ballast(top: 105, left: 15),
                  Ballast(top: 122.5, left: 15),
                  Rails(top: 0, bottom: 0.0, left: 24, right: 0),
                  Rails(top: 0, bottom: 0.0, left: 44, right: 0),
                  Station(),
                ],
              );
            },
            itemCount: dates.length,
          );
        },
      ),
    );
  }
}
