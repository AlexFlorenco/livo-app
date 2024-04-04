import 'package:flutter_modular/flutter_modular.dart';
import 'package:livo_app/app/modules/auth/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
  }

  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => AuthPage());
    super.routes(r);
  }
}
