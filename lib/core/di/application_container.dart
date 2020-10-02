import 'package:get_it/get_it.dart';
import 'package:teste_app_flutter/core/environment/environment.dart';

class ApplicationContainer {
  static final ApplicationContainer _instance =
      ApplicationContainer._internal();

  ApplicationContainer._internal() {}

  factory ApplicationContainer.instance() {
    return _instance;
  }

  final GetIt locator = GetIt.asNewInstance();

  Future<void> setUp(Environment environment) async {
    _setupDependencies(environment);
    // await afterSetup();
  }

  void _setupDependencies(Environment environment) {
    locator.registerSingleton(environment);

    // Home
    // locator.registerFactory<LoadSession>(() => LoadSessionImpl(getMe: resolve(), repository: resolve()));
  }

  // Future<void> afterSetup() async {
  // 	final AuthenticationBloc loginBloc = resolve();
  // 	loginBloc.beginLoad();
  // }

  T resolve<T>() => locator<T>();
}
