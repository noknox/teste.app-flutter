import 'package:json_annotation/json_annotation.dart';
import 'package:teste_app_flutter/core/data/base_model.dart';
import 'package:teste_app_flutter/feature/pet/data/model/pet_breed_model.dart';
import 'package:teste_app_flutter/feature/pet/domain/entity/pet.dart';

part 'pet_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PetModel extends BaseModel {
  String id;
  String name;
  PetBreedModel breed;
  String photoUrl;

  PetModel();

  factory PetModel.fromJson(Map<String, dynamic> json) => _$PetModelFromJson(json);
  Map<String, dynamic> toJson() => _$PetModelToJson(this);

  static PetModel fromEntity(Pet entity) => entity == null ? null : (PetModel()
    ..id = entity.id
    ..name = entity.name
    ..breed = PetBreedModel.fromEntity(entity.breed)
    ..photoUrl = entity.photoUrl
  );

  Pet toEntity() => Pet()
    ..id = this.id
    ..name = this.name
    ..breed = this.breed?.toEntity()
    ..photoUrl = this.photoUrl;
}