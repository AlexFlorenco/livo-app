import 'package:livo_app/app/modules/auth/data/di/setup_di_auth_data.dart';
import 'package:livo_app/app/modules/auth/domain/di/setup_di_auth_domain.dart';

class SetupDI {
  setup(){
    SetupDIAuthDomain().setup();
    SetupDIAuthData().setup();
  }

}