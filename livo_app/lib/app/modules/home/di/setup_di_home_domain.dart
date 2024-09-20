import 'package:livo_app/app/di/di_container.dart';
import 'package:livo_app/app/modules/auth/data/repositories/auth_access_token_repository.dart';
import 'package:livo_app/app/modules/auth/data/repositories/auth_with_email_repository.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_access_token_repository_interface.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_with_email_repository_interface.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_access_token.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_with_email.dart';
import 'package:livo_app/app/modules/home/domain/repositories/get_user_data_repository_interface.dart';
import 'package:livo_app/app/modules/home/domain/usecases/get_user_data.dart';

class SetupDIHomeDomain {
  setup() {
  }

  _registerGetUserDataRepositoryInterface() {
    DIContainer.instance.register<GetUserDataRepositoryInterface>(
      (resolver) => GetUserDataRepository(
        getUserDataService: resolver.resolve(),
      ),
    );
  }

  _registerGetUserDataInterface() {
    DIContainer.instance.register<GetUserDataInterface>(
      (resolver) => GetUserData(
        getUserDataRepository: resolver.resolve(),
      ),
    );
  }
}
