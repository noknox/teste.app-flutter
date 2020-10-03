import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/core/functional/try.dart';
import 'package:teste_app_flutter/feature/pet/data/data_source/local/pet_local_data_source.dart';
import 'package:teste_app_flutter/feature/pet/data/model/pet_model.dart';
import 'package:teste_app_flutter/feature/pet/data/repository/pet_repository_impl.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';
import 'package:teste_app_flutter/feature/pet/domain/repository/pet_repository.dart';

import '../../../../matcher/is_and_matcher.dart';

void main() {
	PetRepository repository;
	PetLocalDataSource localDataSource;

	final _unitToken = '123def';
	final _lastPetId = 'abc456';
	final _data = [PetModel()];

	setUp((){
		localDataSource = PetLocalDataSourceMock();
		repository = PetRepositoryImpl(localDataSource: localDataSource);
	});

	group('list', () {
		group('with local origin ', () {
			test('Should call localDataSource list', () async {
				when(localDataSource.list(any, any)).thenAnswer((_) async => _data);
				await repository.list(_unitToken);
				verify(localDataSource.list(_unitToken));
			});

			test('Should return success if datasource succeeds', () async {
				when(localDataSource.list(any, any)).thenAnswer((_) async => _data);
				final result = await repository.list(_unitToken, _lastPetId);
				expect(result, isA<Success<List<Pet>>>());
			});

			test('Should return rejection if datasource throws', () async {
				when(localDataSource.list(any, any)).thenThrow(Exception());
				final result = await repository.list(_unitToken);
				expect(result, IsAnd<Rejection<List<Pet>>>((it) => it.get() is Failure));
			});
		});
	});
}

class PetLocalDataSourceMock extends Mock implements PetLocalDataSource {}
