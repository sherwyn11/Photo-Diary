import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_diary/components/newFriendAdd.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/hexColor.dart';

class FriendsDialog extends StatelessWidget {
  final List dataVal;

  FriendsDialog({
    @required this.dataVal,
  });

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
                      onTap: () {
                        print(dataVal[index]);
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
                                      dataVal[index],
                                      style: GoogleFonts.pacifico(
                                          textStyle: TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 15.0,
                                      )),
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
                  itemCount: dataVal.length,
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
