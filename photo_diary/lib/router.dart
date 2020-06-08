import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_diary/screens/Login.dart';

class FluroRouter {
  static final router = Router();

  static var usersHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Login();
  });

  static handleRoutes() {
    router.define('login',
        handler: usersHandler, transitionType: TransitionType.cupertino);
  }
}
