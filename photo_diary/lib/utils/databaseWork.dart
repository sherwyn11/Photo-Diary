import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
    String uid = await getCurrentUserUID();
    return _db
        .collection('users')
        .document(uid)
        .collection(otherEmail)
        .snapshots();
  }

  Future<List> getFriendData(String uid) async {
    var friends = await _db.collection('users').document(uid).get();
    List<String> friendList = [];
    for (var friend in friends.data['friends']) {
      friendList.add(friend);
    }
    return friendList;
  }

  Future<bool> saveFriend(String uid, String friendEmail) async {
    var users = await _db.collection('users').getDocuments();
    for (var user in users.documents) {
      if (user.documentID == friendEmail) {
        break;
      }
      return false;
    }
    List<String> test = [friendEmail];
//    await _db
//        .collection('users')
//        .document(uid)
//        .updateData({'friends': FieldValue.arrayUnion(test)});
    return true;
  }
}
