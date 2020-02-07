import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider {
  Firestore _firestore = Firestore.instance;

  Future<bool> isUserExists(String mobile) async {
    print(mobile);
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where('providerId', isEqualTo: mobile)
        .getDocuments();
    final List<DocumentSnapshot> docs = result.documents;

    if (docs.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> addUser(String mobile, String uid, String name,
      String lastSigned, String email) async {
    try {
      await _firestore.collection('users').document(uid).setData({
        'email': email,
        'lastSigned': lastSigned,
        'name': name,
        'providerId': '+91'+mobile,
        'uid': uid
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
