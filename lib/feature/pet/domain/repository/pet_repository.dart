import 'package:teste_app_flutter/core/functional/try.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';

abstract class PetRepository {
	Future<Try<List<Pet>>> list(String unitToken, [String lastPetId]);
}