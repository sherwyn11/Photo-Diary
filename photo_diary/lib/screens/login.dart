import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:photo_diary/components/delayed_animation.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/hexColor.dart';
import 'package:photo_diary/utils/userData.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final int delayedAmount = 100;
  double _scale;
  AnimationController _controller;
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(user.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserData data = new UserData(user.providerId, user.displayName,
        user.photoUrl, user.email, providerData);

    return user;
  }

  Future<void> checkIfLoggedIn() async {
    if (await _auth.currentUser() != null) {
      Fluttertoast.showToast(
        msg: "User already logged in!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );

      _auth.currentUser().then((currUser) {
        uidConst = currUser.email;
        gestureOne = currUser.email;
        gestureTwo = currUser.email;
        otherEmailConst = currUser.email;
        userName = currUser.displayName;
        Navigator.pushReplacementNamed(context, "timeline");
      });
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkIfLoggedIn();

    final color = Colors.white;
    _scale = 1 - _controller.value;
    return ModalProgressHUD(
      inAsyncCall: loading,
      progressIndicator: CircularProgressIndicator(),
      color: HexColor('#FCD0BA'),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: HexColor('#F1828D'),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  AvatarGlow(
                    endRadius: 90,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white24,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 2),
                    startDelay: Duration(seconds: 1),
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Icon(
                            Icons.camera_alt,
                            size: 50.0,
                          ),
                          radius: 50.0,
                        )),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  DelayedAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TyperAnimatedTextKit(
                        text: ["The Photo Diary"],
                        textStyle: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0,
                            letterSpacing: 2.0,
                            color: color,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(4.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    delay: delayedAmount + 2000,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DelayedAnimation(
                    child: Text(
                      "...because every picture, ",
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          fontSize: 22.0,
                          color: color,
                          letterSpacing: 2.0,
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
                    delay: delayedAmount + 3000,
                  ),
                  DelayedAnimation(
                    child: Text(
                      "speaks a thousand words...",
                      style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                          fontSize: 22.0,
                          color: color,
                          letterSpacing: 2.0,
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
                    delay: delayedAmount + 3000,
                  ),
                  SizedBox(
                    height: 75.0,
                  ),
                  DelayedAnimation(
                    child: GestureDetector(
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: GoogleSignInButton(
                          onPressed: () {
                            setState(() {
                              loading = true;
                            });
                            _signIn(context)
                                .then((FirebaseUser user) => {
                                      setState(() {
                                        loading = false;
                                      }),
                                      Navigator.pushReplacementNamed(
                                          context, "timeline")
                                    })
                                .catchError((e) => {
                                      setState(() {
                                        loading = false;
                                      }),
                                      print(e)
                                    });
                          },
                          splashColor: Colors.white,
                          borderRadius: 4.0,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          darkMode: true,
                        ),
                      ),
                    ),
                    delay: delayedAmount + 4000,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  DelayedAnimation(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Text(
                        'Don\'t have an account?',
                        style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: color.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    delay: delayedAmount + 5000,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
