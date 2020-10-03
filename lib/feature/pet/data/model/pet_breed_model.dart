import 'package:json_annotation/json_annotation.dart';
import 'package:teste_app_flutter/core/data/base_model.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet_breed.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet_category.dart';

part 'pet_breed_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PetBreedModel extends BaseModel {
  PetCategory category;
  String name;

  PetBreedModel();

  factory PetBreedModel.fromJson(Map<String, dynamic> json) => _$PetBreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$PetBreedModelToJson(this);

  static PetBreedModel fromEntity(PetBreed entity) => entity == null ? null : (PetBreedModel()
    ..category = entity.category
    ..name = entity.name
  );


  PetBreed toEntity() => PetBreed()
    ..category = this.category
    ..name = this.name;
}