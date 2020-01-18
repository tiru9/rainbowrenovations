import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String providerId;
  final String uid;
  final String name;
  final String lastSigned;
  final String email;

  User({
    this.providerId,
    this.uid,
    this.name,
    this.lastSigned,
    this.email,
  });

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return User(
        providerId: data['providerId'] ?? '',
        uid: data['uid'] ?? '',
        name: data['name'] ?? '',
        lastSigned: data['lastSigned'] ?? '',
        email: data['email'] ?? '');
  }
}
