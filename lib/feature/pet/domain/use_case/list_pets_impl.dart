import 'package:meta/meta.dart';
import 'package:teste_app_flutter/core/functional/failure.dart';
import 'package:teste_app_flutter/core/functional/try.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';
import 'package:teste_app_flutter/feature/pet/domain/repository/pet_repository.dart';
import 'package:teste_app_flutter/feature/pet/domain/use_case/list_pets.dart';

class ListPetsImpl extends ListPets {
	final PetRepository repository;

	ListPetsImpl({@required this.repository}) : assert(repository != null);

	@override
	Future<Try<List<Pet>>> call(ListPetsParam params) async {
		final error = validate(params);
		if (error != null) return Rejection(error);

		return await repository.list(params.unitToken, params.lastPetId);
	}

	Failure validate(ListPetsParam params) {
		if (params == null) return InvalidParamFailure();
		if (params.unitToken?.isNotEmpty != true) return InvalidParamFailure();
		return null;
	}
}