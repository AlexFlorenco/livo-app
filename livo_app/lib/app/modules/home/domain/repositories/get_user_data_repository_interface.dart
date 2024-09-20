import 'package:livo_app/app/modules/auth/domain/entities/user.dart';
import 'package:livo_app/app/modules/home/domain/errors/home_exception.dart';

abstract class GetUserDataRepositoryInterface {
  Future<(HomeException? exception, User? user)> getUserData();
  
}