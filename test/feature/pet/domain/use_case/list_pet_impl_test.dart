import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/core/functional/try.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';
import 'package:teste_app_flutter/feature/pet/domain/repository/pet_repository.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets_impl.dart';

import '../../../../matcher/is_and_matcher.dart';

void main() {
	PetRepository repository;
	ListPets listPets;

	final _unitToken = '123def';
	final _lastPetId = 'abc456';
	final _pet = Pet();
	final _params = ListPetsParam(unitToken: _unitToken, lastPetId: _lastPetId);

	setUp(() {
		repository = PetRepositoryMock();
		listPets = ListPetsImpl(repository: repository);
	});

	group('call', () {
		group('With invalid params', () {
			test('Should invalid params when param is null', () async {
				final result = await listPets.call(null);
				expect(result, IsAnd<Rejection<List<Pet>>>((it) => it.get() is InvalidParamFailure));
			});

			test('Should invalid params when unit token is null', () async {
				final invalid =  ListPetsParam(unitToken: null, lastPetId: _lastPetId);
				final result = await listPets.call(invalid);
				expect(result, IsAnd<Rejection<List<Pet>>>((it) => it.get() is InvalidParamFailure));
			});

			test('Should invalid params when unit token is empty', () async {
				final invalid =  ListPetsParam(unitToken: '', lastPetId: _lastPetId);
				final result = await listPets.call(invalid);
				expect(result, IsAnd<Rejection<List<Pet>>>((it) => it.get() is InvalidParamFailure));
			});
		});

		test('Should call repository list', () async {
			when(repository.list(any, any)).thenAnswer((_) async => Success([_pet]));
			await listPets.call(_params);
			verify(repository.list(_unitToken, _lastPetId));
		});

		test('Should return success when repository succeeds', () async {
			when(repository.list(any, any)).thenAnswer((_) async => Success([_pet]));
			final result = await listPets.call(_params);
			expect(result, IsAnd<Success<List<Pet>>>((it) => it.get().length > 0));
		});

		test('Should return rejection when repository succeeds', () async {
			when(repository.list(any, any)).thenAnswer((_) async => Rejection(UnknownFailure(null)));
			final result = await listPets.call(_params);
			expect(result, IsAnd<Rejection<List<Pet>>>((it) => it.get() is UnknownFailure));
		});
	});

}

class PetRepositoryMock extends Mock implements PetRepository {}