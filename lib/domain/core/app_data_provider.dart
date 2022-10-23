import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:segs/data/services/app_service.dart';
import 'package:segs/models/user.model.dart';

final userService = Provider(
  (ref) => UserService(),
);

final userDataProvider = StreamProvider.family<UserModel, String>((ref, id) {
  var user = ref.watch(userService).getUserById(id);
  return user;
});
final createUser = Provider.family(
  (ref, UserModel userPayload) {
    ref.watch(userService).addNewUser(userPayload);
  },
);
