import 'package:get_it/get_it.dart';
import 'package:teste_app_flutter/core/environment/environment.dart';
import 'package:teste_app_flutter/feature/pet/data/data_source/local/pet_local_data_source.dart';
import 'package:teste_app_flutter/feature/pet/data/data_source/local/pet_local_data_source_impl.dart';
import 'package:teste_app_flutter/feature/pet/data/repository/pet_repository_impl.dart';
import 'package:teste_app_flutter/feature/pet/domain/repository/pet_repository.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets_impl.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_bloc.dart';
import 'package:teste_app_flutter/feature/pet/presentation/bloc/pet_list_bloc_impl.dart';

class ApplicationContainer {
  GetIt getIt = GetIt.instance;

  static final ApplicationContainer _instance =
      ApplicationContainer._internal();

  ApplicationContainer._internal() {}

  factory ApplicationContainer.instance() {
    return _instance;
  }

  Future<void> setUp(Environment environment) async {
    _setupDependencies(environment);
    // await afterSetup();
  }

  void _setupDependencies(Environment environment) {
    getIt.registerSingleton(environment);

    // Home
    getIt.registerFactory<PetLocalDataSource>(() => PetLocalDataSourceImpl());
    getIt.registerFactory<PetRepository>(() => PetRepositoryImpl(localDataSource: resolve()));
    getIt.registerFactory<ListPets>(() => ListPetsImpl(repository: resolve()));
    getIt.registerFactory<PetListBloc>(() => PetListBlocImpl(listPets: resolve()));
  }

  // Future<void> afterSetup() async {
  // 	final AuthenticationBloc loginBloc = resolve();
  // 	loginBloc.beginLoad();
  // }

  T resolve<T>() => getIt<T>();
}
