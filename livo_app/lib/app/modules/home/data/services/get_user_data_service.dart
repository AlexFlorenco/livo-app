import 'package:livo_app/app/modules/auth/data/models/user_model.dart';
import 'package:livo_app/app/modules/home/domain/errors/home_exception.dart';

abstract class GetUserDataServiceInterface {
  Future<(HomeException? exception, UserModel? user)> getUserData();
}

class GetUserDataService implements GetUserDataServiceInterface {
  @override
  Future<(HomeException? exception, UserModel? user)> getUserData() async {
    
    return (null, UserModel());
  }
}