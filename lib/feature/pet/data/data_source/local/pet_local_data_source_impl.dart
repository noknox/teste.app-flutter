import 'package:flutter/foundation.dart';
import 'package:teste_app_flutter/core/data/memory_database.dart';
import 'package:teste_app_flutter/feature/pet/data/data_source/local/pet_local_data_source.dart';
import 'package:teste_app_flutter/feature/pet/data/model/pet_breed_model.dart';
import 'package:teste_app_flutter/feature/pet/data/model/pet_model.dart';
import 'package:nanoid/nanoid.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet_category.dart';

class PetLocalDataSourceImpl extends MemoryDatabase implements PetLocalDataSource {
  PetLocalDataSourceImpl(): super(table: 'pet');

  @override
  Future<List<PetModel>> list(String unitToken, [String lastPetId]) async {
    // Fake delay to give view enough time to display all rendering phases
    await Future.delayed(Duration(seconds: 2));

    final data = await this.readAll(0, 10, sortedBy: 'name');
    return data.map((e) => PetModel.fromJson(e)).toList();
  }

  @override
  Future clear() async {
    await this.teardown();
  }

  @override
  void setup() async {
    await this.teardown();

    final pets = List<PetModel>.generate(25,
            (i) => PetModel()
              ..id = nanoid(15)
              ..name = 'Pet $i'
              ..breed = randomBreed(i)
              ..photoUrl = randomPhotoUrl(i));

    pets.forEach((e) async {
      await this.insert(e);
    });
  }

  PetBreedModel randomBreed(int i) {
    final category = randomCategory(i);

    return PetBreedModel()
        ..category = category
        ..name = '${describeEnum(category)} breed $i';
  }

  PetCategory randomCategory(int i) {
    if (i % 3 == 0) return PetCategory.bird;
    else if (i % 2 == 0) return PetCategory.cat;
    return PetCategory.dog;
  }

  String randomPhotoUrl(int i) {
    if (i % 3 == 0) return 'https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_960,f_auto/DCTM_Penguin_UK_DK_AL526630_wkmzns.jpg';
    else if (i % 2 == 0) return 'https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png';
    return 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-1100x628.jpg';
  }
}