import 'package:emart/consts/consts.dart';

class FireStoreService {
  //get user data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get product according to category
  static getProduct(category) {
    return firestore
        .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete product from cart
  static deleteDocument(docID) {
    return firestore
        .collection(cartCollection)
        .doc(docID)
        .delete();
  }

  //get all chat messages
  static getChatMessage(docID) {
    return firestore
        .collection(chatCollection)
        .doc(docID)
        .collection(messagesCollection)
        .orderBy('created_on',descending: false)
        .snapshots();
  }

}
