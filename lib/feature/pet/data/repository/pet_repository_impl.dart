import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/core/functional/try.dart';
import 'package:teste_app_flutter/feature/pet/data/data_source/local/pet_local_data_source.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';
import 'package:teste_app_flutter/feature/pet/domain/repository/pet_repository.dart';

class PetRepositoryImpl implements PetRepository {
  final PetLocalDataSource localDataSource;

  PetRepositoryImpl({this.localDataSource});

  @override
  Future<Try<List<Pet>>> list(String unitToken, [String lastPetId]) async {
    try {
      final result = await localDataSource.list(unitToken, lastPetId);
      return Success(result.map((e) => e.toEntity()).toList());
    }
    catch(err) {
      return Rejection(UnknownFailure(err));
    }
  }
}