import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_diary/screens/diary.dart';
import 'package:photo_diary/screens/login.dart';
import 'package:photo_diary/screens/signUp.dart';
import 'package:photo_diary/screens/timeline.dart';

class FluroRouter {
  static final router = Router();

  static var signupHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Signup();
  });

  static var loginHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return Login();
  });

  static var timelineHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return TimelinePage();
  });

  static var diaryHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return DiaryPage();
  });

  static handleRoutes() {
    router.define('signup',
        handler: signupHandler, transitionType: TransitionType.fadeIn);

    router.define('login',
        handler: loginHandler, transitionType: TransitionType.cupertino);

    router.define('timeline',
        handler: timelineHandler, transitionType: TransitionType.fadeIn);

    router.define('diary',
        handler: diaryHandler, transitionType: TransitionType.fadeIn);
  }
}
