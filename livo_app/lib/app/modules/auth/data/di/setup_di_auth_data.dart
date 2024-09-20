import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:livo_app/app/di/di_container.dart';
import 'package:livo_app/app/modules/auth/data/services/auth_access_token_service.dart';
import 'package:livo_app/app/modules/auth/data/services/auth_with_email_service.dart';

class SetupDIAuthData {
  setup() {
    _registerAuthWithEmailServiceInterface();
    _registerAuthAccessTokenServiceInterface();
    _registerFlutterSecureStorage();
  }

  _registerAuthWithEmailServiceInterface() {
    DIContainer.instance.register<AuthWithEmailServiceInterface>(
      (_) => AuthWithEmailService(),
    );
  }

  _registerFlutterSecureStorage() {
    DIContainer.instance.register<FlutterSecureStorage>(
      (_) => const FlutterSecureStorage(),
    );
  }

  _registerAuthAccessTokenServiceInterface() {
    DIContainer.instance.register<AuthAccessTokenServiceInterface>(
      (_) =>
          AuthAccessTokenService(secureStorage: DIContainer.instance.resolve()),
    );
  }
}
