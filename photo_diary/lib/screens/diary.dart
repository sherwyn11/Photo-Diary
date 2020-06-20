import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:photo_diary/components/tape.dart';
import 'package:photo_diary/utils/consts.dart';
import 'package:photo_diary/utils/databaseWork.dart';
import 'package:photo_diary/utils/hexColor.dart';

import '../utils/hexColor.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({Key key, this.date, this.text, this.imageUrl}) : super(key: key);
  String date;
  String text;
  String imageUrl;

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final ImagePicker _picker = ImagePicker();
  final _textEditingController = TextEditingController();
  File _image;
  bool uploaded = false;
  String _text;
  String otherEmail = otherEmailConst;
  String dateFinal;
  String url =
      'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b68b1672658119.5beea616e7eaf.jpg';
  bool uploading = false;

  Future<bool> getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      uploaded = true;
    });

    String uid = await Db().getCurrentUserEmail();
    url = await Db().storeImage(uid, otherEmail, _image, dateFinal);
    await Db().addURL(gestureOne, gestureTwo, dateFinal, url, _text);
    return true;
  }

  Future<bool> updateText() async {
    String uid = await Db().getCurrentUserEmail();
    setState(() {
      _text = _textEditingController.text;
    });

    widget.text = _text;

    await Db().addData(gestureOne, gestureTwo, dateFinal, url, _text);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    _text = widget.text;
    dateFinal = widget.date;
    if (widget.imageUrl != null) {
      url = widget.imageUrl;
    }
    return ModalProgressHUD(
      inAsyncCall: uploading,
      child: new Scaffold(
        backgroundColor: HexColor("#FCD0BA"),
        appBar: AppBar(
          title: Text(
            'Save a Memory...',
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                letterSpacing: 4.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: HexColor("#8FB9A8"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          child: new AlertDialog(
                            title: Center(
                              child: new Text(
                                "Upload a new image",
                                style: GoogleFonts.pacifico(
                                  textStyle: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            content: RaisedButton(
                              onPressed: () async {
                                print(this.uploading);
                                this.setState(() {
                                  uploading = true;
                                });
                                print(this.uploading);
//                                final fileUploaded = await getImage();
                                if (await getImage()) {
                                  print(this.uploading);
                                  this.setState(() {
                                    uploading = false;
                                  });
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pop('dialog');
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Click Here',
                                    style: GoogleFonts.pacifico(
                                        textStyle: TextStyle(
                                            letterSpacing: 1.0,
                                            fontSize: 18.0)),
                                  ),
                                  Icon(
                                    Icons.cloud_upload,
                                  ),
                                ],
                              ),
                              color: HexColor('#8FB9A8'),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 400.0,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(7.0, 20.0, 7.0, 96.0),
                          child: uploaded
                              ? Image.file(_image)
                              : Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    elevation: 4.0,
                  ),
                  Tape(top: 0, right: 0, bottom: 360, left: -200),
                  Tape(top: 360, right: -200, bottom: 0, left: 0),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Date: ' + dateFinal,
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Dear Diary, ',
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      child: new AlertDialog(
                        scrollable: true,
                        title: Center(
                          child: new Text(
                            "Write something...",
                            style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                                    letterSpacing: 1.0, fontSize: 20.0)),
                          ),
                        ),
                        content: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          child: SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    cursorColor: HexColor('#8FB9A8'),
                                    maxLines: 10,
                                    style: GoogleFonts.pacifico(
                                      textStyle: TextStyle(
                                        letterSpacing: 2.0,
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    controller: _textEditingController
                                      ..text = _text,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RaisedButton(
                                    color: HexColor('#8FB9A8'),
                                    onPressed: () async {
                                      setState(() {
                                        uploading = true;
                                      });
                                      if (await updateText()) {
                                        setState(() {
                                          uploading = false;
                                        });
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop('dialog');
                                      }
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Update my Diary',
                                          style: GoogleFonts.pacifico(
                                            textStyle: TextStyle(
                                                letterSpacing: 1.0,
                                                fontSize: 18.0),
                                          ),
                                        ),
                                        Icon(Icons.cloud_upload),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    _text,
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
