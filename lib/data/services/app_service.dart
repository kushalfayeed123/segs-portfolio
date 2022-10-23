import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:segs/models/user.model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> usersReference() {
    return _firestore.collection('users');
  }

  Future<bool> addNewUser(UserModel userPayload) async {
    try {
      await usersReference().add(userPayload.toJson()).then(
          (value) => usersReference().doc(value.id).update({'id': value.id}));
      return true;
    } catch (e) {
      return Future.error(e);
    }
  }

  Stream<UserModel> getUserById(String userId) {
    try {
      return usersReference()
          .doc(userId)
          .snapshots()
          .map((event) => UserModel.fromJson(event.data()!));
    } catch (e) {
      throw HttpException(e.toString());
    }
  }
}
