import 'package:flutter_modular/flutter_modular.dart';
import 'package:livo_app/app/modules/auth/controllers/sign_in_controller.dart';
import 'package:livo_app/app/modules/auth/interfaces/sign_in_with_google_interface.dart';
import 'package:livo_app/app/modules/auth/pages/auth_page.dart';
import 'package:livo_app/app/modules/auth/services/sign_in_service.dart';

import 'services/sign_in_firebase_service.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
  }

  @override
  void binds(Injector i) {
    i.addSingleton<ISignInWithGoogle>((i) => FirebaseSignInService());

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => AuthPage());
    super.routes(r);
  }
}
