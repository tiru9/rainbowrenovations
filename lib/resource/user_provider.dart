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
      print('has records..');
      return true;
    }
  }
}
