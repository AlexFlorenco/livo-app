import 'package:flutter_modular/flutter_modular.dart';
import 'package:livo_app/app/modules/auth/auth_module.dart';
import 'package:livo_app/app/modules/auth/pages/auth_page.dart';

class AppModule extends Module {
  // @override
  // List<Module> get imports => [
  //       AuthModule(),
  //     ];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const AuthPage());
    super.routes(r);
  }
}
