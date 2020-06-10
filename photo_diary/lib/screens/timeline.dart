import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/utils/hexColor.dart';

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#FCD0BA"),
        appBar: AppBar(
          title: Text(
            'Your Timeline',
            style: GoogleFonts.pacifico(
              textStyle:
                  TextStyle(letterSpacing: 4.0, fontWeight: FontWeight.bold),
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
            Navigator.pushNamed(context, 'diary');
          },
        ),
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 5.0,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            )),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new Stack(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: new Card(
                    margin: new EdgeInsets.all(20.0),
                    child: new Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Date',
                            style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            'Date',
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
                new Positioned(
                  top: 2.5,
                  left: 15.0,
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
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.grey),
                    ),
                  ),
                ),
                new Positioned(
                  top: 20.0,
                  left: 15.0,
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
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.grey),
                    ),
                  ),
                ),
                new Positioned(
                  top: 105.0,
                  left: 15.0,
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
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.grey),
                    ),
                  ),
                ),
                new Positioned(
                  top: 122.5,
                  left: 15.0,
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
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.grey),
                    ),
                  ),
                ),
                new Positioned(
                  top: 0.0,
                  bottom: 0.0,
                  left: 24.0,
                  child: new Container(
                    height: double.infinity,
                    width: 2.0,
                    color: Colors.grey[850],
                  ),
                ),
                new Positioned(
                  top: 0.0,
                  bottom: 0.0,
                  left: 44.0,
                  child: new Container(
                    height: double.infinity,
                    width: 2.0,
                    color: Colors.grey[850],
                  ),
                ),
                new Positioned(
                  top: 50.0,
                  left: 15.0,
                  child: new Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: new Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor('#FEFAD4'),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 10,
        ));
  }
}
