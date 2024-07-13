import 'package:flutter/foundation.dart';
import 'package:freshproject/apis/user.dart';
import 'package:freshproject/model/users_model.dart';

class AllUsersProvider extends ChangeNotifier {
  List<UserModel?> usersModels = [];

  UserModel? getUserById(String id) {
    return usersModels.where((element) => element?.userId == id).first;
  }

  getAllUser() async {
    var value = await UserService.getAllUserData();

    if (value != null) {
      usersModels.addAll(value);
      notifyListeners();
    }
  }
}
