import 'package:emart/consts/consts.dart';

class FireStoreService {

  //get user data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
