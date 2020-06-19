import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/utils/hexColor.dart';

class Info extends StatelessWidget with FlareController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: HexColor('#F1828D'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Life is a journey...\nEach memory we make is like a station...',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 25.0,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlareActor("assets/journey.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "Preview2"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: HexColor('#F1828D'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'And as the journey of life goes on...\nWe manage to stay strong because of the people we love and the beautiful memories we make with them...',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 25.0,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 1.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlareActor(
                        "assets/love.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: "heart",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: HexColor('#8FB9A8'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/timeline');
                    },
                    child: Text(
                      'Create my first diary',
                      style: GoogleFonts.pacifico(
                        textStyle:
                            TextStyle(letterSpacing: 1.0, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    throw UnimplementedError();
  }

  @override
  void initialize(FlutterActorArtboard artboard) {}

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
