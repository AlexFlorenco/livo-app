import 'package:livo_app/app/modules/auth/data/models/user_model.dart';
import 'package:livo_app/app/modules/home/domain/errors/home_exception.dart';
import 'package:livo_app/app/modules/home/domain/repositories/get_user_data_repository_interface.dart';

class GetUserDataRepository implements GetUserDataRepositoryInterface {
  @override
  Future<(HomeException?, UserModel?)> getUserData() {
  }
  
}