import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:livo_app/app/app_module.dart';
import 'package:provider/provider.dart';

import 'app/app_widget.dart';
import 'app/modules/auth/controllers/initial_page_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/core/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ModularApp(
    module: AppModule(),
    child: Provider<InitialPageStore>(
      create: (_) => InitialPageStore(),
      child: const LivoApp(),
    ),
  ));
}
