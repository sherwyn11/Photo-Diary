import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/components/viewPersons.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/databaseWork.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
            onPressed: () async {
              var data = await Db().getFriendData(uidConst);
              showDialog(
                context: context,
                builder: (BuildContext context) => FriendsDialog(
                  dataVal: data[0],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
