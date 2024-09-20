import 'package:livo_app/app/modules/auth/domain/entities/user.dart';
import 'package:livo_app/app/modules/home/domain/errors/home_exception.dart';
import 'package:livo_app/app/modules/home/domain/repositories/get_user_data_repository_interface.dart';

abstract class GetUserDataInterface {
  Future<(HomeException? exception, User? user)> getUserData();
}

class GetUserData implements GetUserDataInterface {
  final GetUserDataRepositoryInterface getUserDataRepository;
  GetUserData({required this.getUserDataRepository});

  @override
  Future<(HomeException?, User?)> getUserData() {
    return getUserDataRepository.getUserData();
  }
}
