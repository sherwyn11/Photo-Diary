import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_diary/utils/consts.dart';

class Db {
  Firestore _db = Firestore.instance;
  Future<FirebaseUser> _user = FirebaseAuth.instance.currentUser();
  FirebaseStorage firebaseStorage =
      FirebaseStorage(storageBucket: 'gs://photo-diary-1cfef.appspot.com/');

  Future<String> getCurrentUserUID() async {
    String uid;
    await _user.then((value) {
      uid = value.uid;
    });
    return uid;
  }

  Future<String> getCurrentUserEmail() async {
    String email;

    await _user.then((value) {
      email = value.email;
    });

    return email;
  }

  Future<bool> addData(String uid, String otherEmail, String date, String url,
      String text) async {
    await _db
        .collection('users')
        .document(uid)
        .collection(otherEmail)
        .document(date.toString())
        .setData({'image_url': url, 'text': text});

    return true;
  }

  Future<bool> addURL(String uid, String otherEmail, String date, String url,
      String text) async {
    await _db
        .collection('users')
        .document(uid)
        .collection(otherEmail)
        .document(date.toString())
        .setData({'image_url': url, 'text': text});

    return true;
  }

  Future<String> storeImage(
      String uid, String otherEmail, File image, String date) async {
    String ext = image.path.split('/').last.split('.').last;
    String filePath = uid + '/' + otherEmail + '/' + date + '.' + ext;
    StorageUploadTask uploadTask =
        firebaseStorage.ref().child(filePath).putFile(image);
    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = dowurl.toString();
    print(url);
    return url;
  }

  Future<Stream<QuerySnapshot>> getTimelineData(String otherEmail) async {
    String uid = await getCurrentUserEmail();
    var details = await _db.collection('users').document(uidConst).get();
    for (var detail in details.data['friends']) {
      if (detail['user'] == otherEmail) {
        if (detail['isMajor']) {
          gestureOne = uid;
          gestureTwo = otherEmail;
          return _db
              .collection('users')
              .document(uid)
              .collection(otherEmail)
              .snapshots();
        } else {
          gestureOne = otherEmail;
          gestureTwo = uid;
          return _db
              .collection('users')
              .document(otherEmail)
              .collection(uid)
              .snapshots();
        }
      }
    }
  }

  Future<List> getFriendData(String uid) async {
    var friends = await _db.collection('users').document(uid).get();
    List<String> friendList = [];
    List<bool> isMajorList = [];
    for (var friend in friends.data['friends']) {
      friendList.add(friend['user']);
      isMajorList.add(friend['isMajor']);
    }
    return [friendList, isMajorList];
  }

  Future<bool> saveFriend(String uid, String friendEmail) async {
    int flag = 0;
    var users = await _db.collection('users').getDocuments();
    for (var user in users.documents) {
      print(user.documentID);
      if (user.documentID == friendEmail) {
        flag = 1;
        break;
      }
    }
    if (flag == 0) {
      return false;
    }
    var data = await getFriendData(friendEmail);
    var friendList = data[0];
    var isMajorList = data[1];

    List<dynamic> newData = [
      {'isMajor': true, 'user': friendEmail}
    ];

    for (var user in friendList) {
      if (user == uid) {
        List<dynamic> newDataIn = [
          {'isMajor': false, 'user': friendEmail}
        ];
        await _db
            .collection('users')
            .document(uid)
            .updateData({'friends': FieldValue.arrayUnion(newDataIn)});
        return true;
      }
    }

    await _db
        .collection('users')
        .document(uid)
        .updateData({'friends': FieldValue.arrayUnion(newData)});
    return true;
  }
}
