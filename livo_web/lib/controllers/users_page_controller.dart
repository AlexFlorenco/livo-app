import 'package:get/state_manager.dart';
import 'package:result_dart/result_dart.dart';

import '../models/User.dart';
import '../services/users_service.dart';

class UsersPageController extends GetxController {
  RxList<User> userList = <User>[].obs;

  Future<String?> getUsers() async {
    var response = await UsersService().getUsers();
    return response.fold((success) {
      List<User> userListTemp = ((success['users'] as List)
          .map((user) => User.fromJson(user))
          .toList()
        ..sort((a, b) => a.name.compareTo(b.name)));

      userList.assignAll(userListTemp);
      return null;
    }, (failure) {
      return failure['message'];
    });
  }

  AsyncResult<String, String> deleteUser(String id) async {
    var response = await UsersService().deleteUser(id);

    return response.fold((success) async {
      await getUsers();
      return Success(success['message']);
    }, (failure) {
      return Failure(failure['message']);
    });
  }

  AsyncResult<String, String> updateUser(
      String id, String name, String email, String password) async {
    var response = await UsersService().updateUser(id, name, email, password);
    int index = userList.indexWhere((user) => user.id == id);

    return response.fold((success) async {
      if (index != -1) {
        userList[index].name = name;
        userList[index].email = email;
        userList[index].password = password;
        userList.refresh();
      }
      await getUsers();
      return Success(success['message']);
    }, (failure) {
      return Failure(failure['message']);
    });
  }

  AsyncResult<String, String> createUser(
      String name, String email, String password) async {
    var response = await UsersService().createUser(name, email, password);

    return response.fold((success) async {
      await getUsers();
      return Success(success['message']);
    }, (failure) {
      return Failure(failure['message']);
    });
  }
}
