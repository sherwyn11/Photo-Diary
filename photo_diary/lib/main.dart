import 'package:flutter/material.dart';
import 'package:photo_diary/router.dart';

void main() {
  FluroRouter.handleRoutes();
  runApp(PhotoDiary());
}

class PhotoDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Photo Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'login',
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}
