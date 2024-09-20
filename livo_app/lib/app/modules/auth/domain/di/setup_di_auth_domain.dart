import 'package:livo_app/app/di/di_container.dart';
import 'package:livo_app/app/modules/auth/data/repositories/auth_access_token_repository.dart';
import 'package:livo_app/app/modules/auth/data/repositories/auth_with_email_repository.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_access_token_repository_interface.dart';
import 'package:livo_app/app/modules/auth/domain/repositories/auth_with_email_repository_interface.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_access_token.dart';
import 'package:livo_app/app/modules/auth/domain/usecases/auth_with_email.dart';

class SetupDIAuthDomain {
  setup() {
    _registerAuthWithEmailRepositoryInterface();
    _registerAuthWithEmailInterface();
    _registerAuthAccessTokenRepositoryInterface();
    _registerAuthAccessTokenInterface();
  }

  _registerAuthWithEmailRepositoryInterface() {
    DIContainer.instance.register<AuthWithEmailRepositoryInterface>(
      (resolver) => AuthWithEmailRepository(
        authWithEmailService: resolver.resolve(),
      ),
    );
  }

  _registerAuthWithEmailInterface() {
    DIContainer.instance.register<AuthWithEmailInterface>(
      (resolver) => AuthWithEmail(
        authWithEmailRepository: resolver.resolve(),
      ),
    );
  }

  _registerAuthAccessTokenRepositoryInterface() {
    DIContainer.instance.register<AuthAccessTokenRepositoryInterface>(
      (resolver) => AuthAccessTokenRepository(
        authAccessTokenService: resolver.resolve(),
      ),
    );
  }

  _registerAuthAccessTokenInterface() {
    DIContainer.instance.register<AuthAccessTokenInterface>(
      (resolver) => AuthAccessToken(
        authAccessTokenRepository: resolver.resolve(),
      ),
    );
  }
}
