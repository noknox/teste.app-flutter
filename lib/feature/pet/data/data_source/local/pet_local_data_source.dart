import 'package:teste_app_flutter/feature/pet/data/model/pet_model.dart';

abstract class PetLocalDataSource {
  Future<List<PetModel>> list(String unitToken, [String lastPetId]);
  Future clear();
}