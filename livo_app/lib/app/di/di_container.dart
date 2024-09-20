import 'package:get_it/get_it.dart';

class DIContainer {
  static final instance = DIContainer._();

  final _getIt = GetIt.instance;

  DIContainer._();

  register<T extends Object>(
    T Function(DIContainer) func, {
    String? instanceName,
  }) {
    _getIt.registerFactory<T>(
      () {
        return func(DIContainer.instance);
      },
      instanceName: instanceName,
    );
  }

    T resolve<T extends Object>({
    dynamic param1,
    dynamic param2,
    String? instanceName,
  }) {
    return _getIt.get<T>(
      param1: param1,
      param2: param2,
      instanceName: instanceName,
    );
  }}