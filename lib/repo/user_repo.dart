import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g_test/model/user_model.dart';
import 'package:g_test/util/string_constants.dart';

class UserRepo {
  static Future<DocumentReference<Map<String, dynamic>>> addUserToFireStore(
    UserModel userModel,
  ) async {
    return await FirebaseFirestore.instance
        .collection(StringConstants.userTable)
        .add(userModel.toMap());
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> checkIfUserIsInFireStore(
    String phone,
  ) async {
    return await FirebaseFirestore.instance
        .collection(StringConstants.userTable)
        .where("userPhone", isEqualTo: phone)
        .limit(1)
        .get();
  }
}
