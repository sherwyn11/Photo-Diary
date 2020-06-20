import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/components/newFriendAdd.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/databaseWork.dart';
import 'package:photo_diary/utils/hexColor.dart';

class FriendsDialog extends StatefulWidget {
  FriendsDialog({Key key, this.dataVal}) : super(key: key);
  var dataVal;

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<FriendsDialog> {
  void getFriendList() async {
    var temp = await Db().getFriendData(uidConst);
    widget.dataVal = temp[0];
    print(widget.dataVal[0]);
  }

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
          margin: EdgeInsets.only(top: Consts.avatarRadius),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'People You\'ve added',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(letterSpacing: 2.0, fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        print(widget.dataVal[index]);
                        otherEmailConst = widget.dataVal[index];
                        await Db().getTimelineData(otherEmailConst);
                        print('One ' + gestureOne);
                        print('Two ' + gestureTwo);
                        Navigator.pop(context, index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      widget.dataVal[index].toString(),
                                      style: GoogleFonts.pacifico(
                                        textStyle: TextStyle(
                                          letterSpacing: 1.0,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: widget.dataVal.length,
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
                  Icons.person_add,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    getFriendList();
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
