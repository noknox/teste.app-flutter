import 'package:meta/meta.dart';
import 'package:teste_app_flutter/core/base/use_case.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';

abstract class ListPets extends UseCase<List<Pet>, ListPetsParam> {}
class ListPetsParam {
	final String unitToken;
	final String lastPetId;

	ListPetsParam({@required this.unitToken, this.lastPetId});
}