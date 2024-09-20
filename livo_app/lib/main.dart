import 'package:flutter/material.dart';
import 'package:livo_app/app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:livo_app/app/di/setup_di.dart';
import 'app/core/config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SetupDI().setup();

  runApp(const LivoApp());
}
